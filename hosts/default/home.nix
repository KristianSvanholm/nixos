{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/hyprland.nix
    ../../modules/home/zsh.nix
    ../../modules/home/common.nix
    ../../modules/home/modrinth.nix
  ];

  # Important
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    sessionVariables = {
      EDITOR = "nvim";
      WEBKIT_DISABLE_DMABUF_RENDERER = 1;
    };
  };

  programs = {
    alacritty.enable = true;
    home-manager.enable = true; # Let Home Manager manage itself
  };

  # Bluetooth media controls
  services.mpris-proxy.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    networkmanagerapplet
    mullvad-vpn
    wakeonlan
    nitch
  ];

  stylix.targets = {
    btop.enable = false;
  };

  home.stateVersion = "24.05"; # Dont touch
}
