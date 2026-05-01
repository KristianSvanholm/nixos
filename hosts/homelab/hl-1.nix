{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-1.nix
    ../../modules/nixos/homelab/k3s.nix
  ];
  networking.hostName = "HomeLab-1";
}
