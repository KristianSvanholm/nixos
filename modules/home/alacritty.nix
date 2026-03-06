{config, lib, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary.background = lib.mkForce "#${config.lib.stylix.colors.base01}";
    };
  };
}
