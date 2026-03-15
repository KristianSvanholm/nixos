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
      splash = false;
      wallpaper = {
        monitor = "";
        path = "${config.stylix.image}";
      };
    };
  };
}
