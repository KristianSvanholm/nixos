{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/nixos/wayshot.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  security.pam.services.hyprlock = {}; # Enable PAM for hyprlock
}
