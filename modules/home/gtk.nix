{pkgs, ...}: let
  papirus-green = pkgs.papirus-icon-theme.override {color = "green";};
in {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-green;
    };
  };
}
