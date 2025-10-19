{pkgs, ...}: {
  imports = [
    ../home.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/common.nix
    ../../modules/home/modrinth.nix
  ];

  git.opSSHKey = true;
  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '';
    };
  };

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    networkmanagerapplet
    wakeonlan
    aseprite
    nitch
  ];
}
