{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "ayu";
      theme_background = false;
      rounded_corners = true;
      graph_symbol = "braille";
      update_ms = 100;
      vim_keys = true;
    };
  };
}
