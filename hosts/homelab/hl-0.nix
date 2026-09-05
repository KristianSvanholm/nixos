{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-0.nix
    ../../modules/nixos/homelab/k3s.nix
    ../../modules/nix-cache.nix
  ];
  homelab.clusterInit = true;
  homelab.role = "server";
  networking.hostName = "HomeLab-0";
}
