{pkgs, ...}: {
  imports = [
    ../../modules/home/home.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/common.nix
    #../../modules/home/modrinth.nix
  ];

  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '';
    };
  };

  # Bluetooth media controls
  services.mpris-proxy.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    networkmanagerapplet
    wakeonlan
    aseprite
    nitch
    typst
  ];
}
