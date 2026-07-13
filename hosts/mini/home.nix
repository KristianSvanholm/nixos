{pkgs, ...}: {
  imports = [
    ../home.nix
    #../../modules/home/hyprland.nix
    #../../modules/home/mangowm.nix
    ../../modules/home/common.nix
    #../../modules/home/fuzzel.nix
    ../../modules/home/textfox.nix
    ../../modules/home/hyprpaper.nix
    ../../modules/home/gtk.nix
    ../../modules/home/mako.nix
    ../../modules/home/grim.nix
    ../../modules/home/rofi.nix
    ../../modules/home/waybar.nix
    #../../modules/home/modrinth.nix
  ];

  git.opSSHKey = true;
  #hyprland.layout = "scrolling";
  #hyprland.animations = true;
  programs = {
    obs-studio.enable = true;
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        IdentityAgent = "~/.1password/agent.sock";
      };
    };
  };

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    jotta-cli
    networkmanagerapplet
    better-control
    nitch
    opencode
    winboat
  ];
}
