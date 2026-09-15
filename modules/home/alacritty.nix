{...}: {
  stylix.targets.alacritty.enable = false;

  programs.alacritty = {
    enable = true;
    settings.general.import = ["~/.config/alacritty/themes/noctalia.toml"];
  };
}
