{pkgs, ...}: {
  imports = [
    ../home.nix
    ../../modules/home/common.nix
    ../../modules/home/textfox.nix
    ../../modules/home/hyprpaper.nix
    ../../modules/home/gtk.nix
    ../../modules/home/mako.nix
    ../../modules/home/grim.nix
    ../../modules/home/rofi.nix
    ../../modules/home/waybar.nix
  ];

  git.opSSHKey = true;
  programs = {
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
    pi-coding-agent
    winboat
  ];
}
