{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-1.nix
  ];
  networking.hostName = "HomeLab-1";
}
