{
  config,
  lib,
  ...
}: {
  stylix.targets.gtk.enable = false;

  gtk = {
    enable = true;
    gtk3.extraCss = ''@import url("${config.home.homeDirectory}/.config/gtk-3.0/noctalia.css");'';
    gtk4.extraCss = ''@import url("${config.home.homeDirectory}/.config/gtk-4.0/noctalia.css");'';
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
    };
  };
}
