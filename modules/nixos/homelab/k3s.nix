{
  config,
  lib,
  ...
}:
with lib; {
  options.homelab = {
    role = mkOption {
      type = types.str;
      description = "k3s node role";
      default = "agent";
    };
    clusterInit = mkOption {
      type = types.bool;
      description = "if init node";
      default = false;
    };
    ip = mkOption {
      type = types.str;
      description = "k3s main node ip";
      default = "192.168.3.112";
    };
    nodes = mkOption {
      type = types.listOf types.str;
      description = "k3s node ips";
      default = ["192.168.3.112" "192.168.3.91"];
    };
  };
  config = {
    # servicelb ports are DNATed to pods before nixos-fw sees them; only host listeners belong here
    networking.firewall = {
      allowedTCPPorts = [6443];
      # flannel vxlan is unauthenticated; kubelet also gets scraped by metrics-server from the pod cidr
      extraCommands =
        concatMapStrings (ip: ''
          iptables -A nixos-fw -p udp --dport 8472 -s ${ip} -j nixos-fw-accept
          iptables -A nixos-fw -p tcp --dport 10250 -s ${ip} -j nixos-fw-accept
        '')
        config.homelab.nodes
        + ''
          iptables -A nixos-fw -p tcp --dport 10250 -s 10.42.0.0/16 -j nixos-fw-accept
        '';
    };

    services.k3s = mkMerge [
      {
        enable = true;
        inherit (config.homelab) role;
        inherit (config.homelab) clusterInit;
      }
      (mkIf (!config.homelab.clusterInit) {
        tokenFile = "/var/lib/rancher/k3s/server/token";
        serverAddr = "https://${config.homelab.ip}:6443";
      })
      (mkIf config.homelab.clusterInit {
        disable = ["traefik"];
      })
    ];
  };
}
