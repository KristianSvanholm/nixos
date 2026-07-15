{config, lib, pkgs, ...}: let
  papirus-green = pkgs.papirus-icon-theme.override {color = "green";};
in {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-green;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
    };
  };
}
