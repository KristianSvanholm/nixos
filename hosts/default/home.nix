{pkgs, ...}: {
  imports = [
    ../../modules/home/hyprland.nix
    ../../modules/home/home.nix
    ../../modules/home/common.nix
    ../../modules/home/modrinth.nix
  ];

  # Bluetooth media controls
  services.mpris-proxy.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    networkmanagerapplet
    mullvad-vpn
    wakeonlan
    nitch
  ];
}
