{pkgs, ...}: {
  imports = [
    ../home.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/common.nix
    ../../modules/home/fuzzel.nix
    ../../modules/home/textfox.nix
    #../../modules/home/modrinth.nix
  ];

  git.opSSHKey = true;
  hyprland.layout = "scrolling";
  hyprland.animations = true;
  programs = {
    obs-studio.enable = true;
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        extraOptions = {
          IdentityAgent = "~/.1password/agent.sock";
        };
      };
    };
  };

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    jotta-cli
    networkmanagerapplet
    aseprite
    nitch
    opencode
    winboat
  ];
}
