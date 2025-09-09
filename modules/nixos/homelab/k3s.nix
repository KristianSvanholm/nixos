{
  pkgs,
  config,
  ...
}: {
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
    ];
    allowedUDPPorts = [
      51820 # wireguard
      8472
    ]; # flannel: require if using multi-node for inter-node network
  };

  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString ["--debug" "--disable=traefik"];
    #configPath = "${config.user.home}/.kube/config";
    #token = "";
    #clusterInit = true;
  };

  # Shared media volumes
  users.groups.media = {
    gid = 1500;
  };
}
