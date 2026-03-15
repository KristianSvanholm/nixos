{
  lib,
  config,
  ...
}: {
  stylix.targets.hyprpaper.enable = lib.mkForce false;

  services.hyprpaper = {
    enable = lib.mkForce true;
    settings = {
      ipc = "on";
      preload = ["${config.stylix.image}"];
      wallpaper = [
        ",${config.stylix.image}"
      ];
    };
  };
}
