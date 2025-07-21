{...}: {
  imports = [
    ../../modules/nixos/wayshot.nix
  ];

  programs.hyprland.enable = true;

  security.pam.services.hyprlock = {}; # Enable PAM for hyprlock
}
