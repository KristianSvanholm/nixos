{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-1.nix
    ../../modules/nixos/homelab/k3s.nix
  ];
  networking.hostName = "HomeLab-1";

  services.k3s.nodeLabel = [
    "homelab/av1-decode=true" # N150 iGPU, jellyfin is pinned here
  ];
}
