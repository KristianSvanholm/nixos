{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-0.nix
    ../../modules/nixos/homelab/k3s.nix
    ../../modules/nixos/homelab/nfs.nix
  ];
  homelab.clusterInit = true;
  homelab.role = "server";
  networking.hostName = "HomeLab-0";

  services.k3s.nodeLabel = [
    "homelab/edge=true" # holds the LAN address the router forwards to
    "homelab/hdd=true" # owns the 15T disk, exports it over NFS
  ];
}
