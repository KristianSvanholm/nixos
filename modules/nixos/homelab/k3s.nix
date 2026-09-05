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
  };
  config = {
    networking.firewall = {
      allowedTCPPorts = [
        6443 # k3s
        53 # dns
        80 # web
        3000 # adguard setup
        443 # websec
        8080 # webext
        8443 # websecext
        25565 # minecraft
      ];
      allowedUDPPorts = [
        53 # dns
        443 # web
        51820 # wireguard
        24454 # minecraft-vc
        8472 # flannel: require if using multi node for inter-node networking
      ];
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

    # Shared media volumes
    users.groups.media = {
      gid = 1500;
    };
  };
}
