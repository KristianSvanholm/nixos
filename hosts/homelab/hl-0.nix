{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-0.nix
  ];
  homelab.clusterInit = true;
  homelab.role = "server";
  networking.hostName = "HomeLab-0";
}
