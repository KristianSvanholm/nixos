{pkgs, ...}: {
  home.packages = with pkgs; [rofi-power-menu];

  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = ["drun" "window"];
      show-icons = true;
      display-drun = "λ";
      display-window = "λ";
      drun-display-format = "{icon} {name}";
      window-display-format = "{icon} {name}";
    };
    plugins = with pkgs; [rofi-calc];
  };

  xdg.desktopEntries = {
    "rofi-power" = {
      name = "Power options";
      icon = "Rofi";
      exec = "rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=shutdown/reboot\"";
    };
    "rofi-calc" = {
      name = "Calc";
      icon = "Rofi";
      exec = "rofi -show calc -modi calc -no-show-match -no-persist-history -no-sort";
    };
  };
}
