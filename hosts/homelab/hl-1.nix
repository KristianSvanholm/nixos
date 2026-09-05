{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-1.nix
    ../../modules/nixos/homelab/k3s.nix
    ../../modules/nix-cache.nix
  ];
  networking.hostName = "HomeLab-1";
}
