{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  home.packages = with pkgs; [rofi-power-menu];

  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;
    font = "${config.stylix.fonts.monospace.name} 9";
    extraConfig = {
      modi = "drun,window";
      show-icons = true;
      display-drun = "> ";
      display-window = "> ";
      drun-display-format = "{icon} {name}";
      window-display-format = "{icon} {name}";
    };
    theme = let
      colors = config.lib.stylix.colors;
      tint = colors.${config.tint};
    in {
      "*" = {
        bg = mkLiteral "#${colors.base00}";
        fg = mkLiteral "#${colors.base05}";
        accent = mkLiteral "#${tint}";
        bg-alt = mkLiteral "#${colors.base01}";
        fg-dark = mkLiteral "#${colors.base00}";
      };
      window = {
        width = mkLiteral "15%";
        background-color = mkLiteral "@bg";
        border = mkLiteral "0px";
      };
      mainbox = {
        background-color = mkLiteral "transparent";
      };
      inputbar = {
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "4px 6px";
        children = map mkLiteral ["prompt" "entry"];
      };
      prompt = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
      };
      entry = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
      };
      listview = {
        background-color = mkLiteral "transparent";
        padding = mkLiteral "2px 0";
        lines = 8;
        spacing = mkLiteral "0px";
      };
      "element" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "2px 6px";
      };
      "element selected" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "@fg-dark";
      };
      "element-icon" = {
        background-color = mkLiteral "transparent";
        size = mkLiteral "1em";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };
    };
  };

  xdg.desktopEntries = {
    "rofi-power" = {
      name = "Power options";
      icon = "Rofi";
      exec = "rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=shutdown/reboot\"";
    };
  };
}
