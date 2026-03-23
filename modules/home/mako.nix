{pkgs, lib, config, ...}: {
  home.packages = [pkgs.libnotify];

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-color = lib.mkForce "#${config.lib.stylix.colors.${config.tint}}";
    };
  };
}
