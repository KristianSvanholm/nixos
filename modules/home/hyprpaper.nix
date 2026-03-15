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
      wallpaper = [
        {
          monitor = "";
          path = "${config.stylix.image}";
        }
      ];
    };
  };
}
