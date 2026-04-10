{pkgs, ...}: let
  papirus-green = pkgs.papirus-icon-theme.override {color = "green";};
in {
  gtk = {
    enable = true;
    gtk4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-green;
    };
  };
}
