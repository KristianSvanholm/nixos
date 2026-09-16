{pkgs, ...}: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      cmd + shift - 1 : yabai -m window --space 1; yabai -m space --focus 1
      cmd + shift - 2 : yabai -m window --space 2; yabai -m space --focus 2
      cmd + shift - 3 : yabai -m window --space 3; yabai -m space --focus 3
      cmd + shift - 4 : yabai -m window --space 4; yabai -m space --focus 4
      cmd + shift - 5 : yabai -m window --space 5; yabai -m space --focus 5

      cmd - h : yabai -m window --focus west || yabai -m display --focus west
      cmd - j : yabai -m window --focus south || yabai -m display --focus south
      cmd - k : yabai -m window --focus north || yabai -m display --focus north
      cmd - l : yabai -m window --focus east || yabai -m display --focus east

      cmd + shift - h : yabai -m window --swap west || yabai -m window --display west --focus
      cmd + shift - j : yabai -m window --swap south || yabai -m window --display south --focus
      cmd + shift - k : yabai -m window --swap north || yabai -m window --display north --focus
      cmd + shift - l : yabai -m window --swap east || yabai -m window --display east --focus

      cmd - return : alacritty

      cmd - f : yabai -m window --toggle zoom-fullscreen
    '';
  };
}
