{pkgs, ...}: {
  # Howto
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/cluster/k3s/docs/USAGE.md
  environment.systemPackages = with pkgs; [
    fluxcd
    kubernetes-helm
    kubectl
  ];

  networking.firewall = {
    allowedTCPPorts = [
      6443 # k3s
      80 # web
      443 # websec
      8080 # webext
      8443 # websecext
      25565 # minecraft
    ];
    allowedUDPPorts = [
      51820 # wireguard
      24454 # minecraft-vc
      8472 # flannel: require if using multi node for inter-node networking
    ];
  };

  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString ["--debug" "--disable=traefik"];
  };

  # Shared media volumes
  users.groups.media = {
    gid = 1500;
  };
}
