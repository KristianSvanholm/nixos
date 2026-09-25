{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.umbriel.homeModules.default];

  home.packages = [pkgs.xwayland-satellite];

  programs.umbriel = {
    enable = true;

    settings = {
      general = {
        autostart = [
          "noctalia"
          "1password --silent"
          # Warm headless ghostty daemon so the first window opens fast
          "systemctl --user start app-com.mitchellh.ghostty.service"
        ];
        mod_key = "Super";
        xwayland = true;
      };

      include.optional.files = ["~/.config/umbriel/noctalia.toml"];

      output."DP-2" = {
        mode = "2560x1440@165";
        scale = 1;
        position = [0 0];
      };

      layout = {
        mode = "scrolling";
        gap = 10;
        struts.bottom = -6;
        extent_presets = [0.33333 0.5 0.66667];
        scrolling = {
          default_extent_fraction = 0.5;
          center_focused = "never";
        };
      };

      appearance = {
        prefer_no_csd = true;
        corner_radius = 0;
        border_width = 1;
        outer_border_width = 0;
      };

      input = {
        keyboard = {
          layout = "no";
          numlock_toggle = true;
        };
        touchpad = {
          tap = true;
          natural_scroll = true;
        };
        cursor.follows_focus = true;
        cursor.size = 16;
        focus.follows_mouse = true;
      };

      keybinds = {
        "Mod+Return" = "spawn:ghostty";
        "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+X" = "spawn:noctalia msg session lock";
        "Mod+Q" = "window-close";
        "Mod+Shift+E" = "session-quit";
        "Mod+Shift+Slash" = "cheatsheet-toggle";

        "Mod+H" = "window-focus-left";
        "Mod+J" = "window-focus-down";
        "Mod+K" = "window-focus-up";
        "Mod+L" = "window-focus-right";

        "Mod+Shift+H" = "column-move-left";
        "Mod+Shift+J" = "window-move-down";
        "Mod+Shift+K" = "window-move-up";
        "Mod+Shift+L" = "column-move-right";

        "Mod+Tab" = "spawn:noctalia msg screenshot-region";

        "Mod+Home" = "column-focus-first";
        "Mod+End" = "column-focus-last";
        "Mod+Ctrl+Home" = "column-move-to-first";
        "Mod+Ctrl+End" = "column-move-to-last";

        "Mod+Ctrl+L" = "output-focus-next";
        "Mod+Shift+Ctrl+L" = "window-move-to-output-next";

        "Mod+BracketLeft" = "window-consume-left";
        "Mod+BracketRight" = "window-consume-right";
        "Mod+Comma" = "window-consume-left";
        "Mod+Period" = "window-consume-right";

        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+Minus" = "window-modify-primary-extent:-0.1";
        "Mod+Equal" = "window-modify-primary-extent:0.1";
        "Mod+Shift+Minus" = "window-modify-secondary-extent:-0.1";
        "Mod+Shift+Equal" = "window-modify-secondary-extent:0.1";

        "Mod+F" = "window-toggle-maximize";
        "Mod+Shift+F" = "window-toggle-fullscreen";
        "Mod+Ctrl+F" = "window-toggle-maximize-to-edges";
        "Mod+C" = "column-center";
        "Mod+V" = "window-toggle-floating";
        "Mod+Shift+V" = "window-focus-switch-floating";

        "Mod+O" = {
          action = "overview-toggle";
          repeat = false;
        };

        "Mod+Space" = "scratchpad-toggle";
        "Mod+Shift+Space" = "window-move-to-scratchpad";
        "Mod+Ctrl+Space" = "window-restore-from-scratchpad";

        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod+6" = "workspace-switch:6";
        "Mod+7" = "workspace-switch:7";
        "Mod+8" = "workspace-switch:8";
        "Mod+9" = "workspace-switch:9";
        "Mod+Shift+1" = "window-move-to-workspace:1";
        "Mod+Shift+2" = "window-move-to-workspace:2";
        "Mod+Shift+3" = "window-move-to-workspace:3";
        "Mod+Shift+4" = "window-move-to-workspace:4";
        "Mod+Shift+5" = "window-move-to-workspace:5";
        "Mod+Shift+6" = "window-move-to-workspace:6";
        "Mod+Shift+7" = "window-move-to-workspace:7";
        "Mod+Shift+8" = "window-move-to-workspace:8";
        "Mod+Shift+9" = "window-move-to-workspace:9";

        "Mod+Page_Up" = "workspace-previous";
        "Mod+Page_Down" = "workspace-next";
        "Mod+Shift+Page_Up" = "window-move-to-workspace-previous";
        "Mod+Shift+Page_Down" = "window-move-to-workspace-next";

        "Mod+WheelUp" = "window-focus-left";
        "Mod+WheelDown" = "window-focus-right";

        "XF86AudioRaiseVolume" = {
          action = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
          allow_when_locked = true;
        };
        "XF86AudioLowerVolume" = {
          action = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          allow_when_locked = true;
        };
        "XF86AudioMute" = {
          action = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          allow_when_locked = true;
        };
        "XF86AudioMicMute" = {
          action = "spawn:wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          allow_when_locked = true;
        };
        "XF86AudioPlay" = {
          action = "spawn:playerctl play-pause";
          allow_when_locked = true;
        };
        "XF86AudioStop" = {
          action = "spawn:playerctl stop";
          allow_when_locked = true;
        };
        "XF86AudioPrev" = {
          action = "spawn:playerctl previous";
          allow_when_locked = true;
        };
        "XF86AudioNext" = {
          action = "spawn:playerctl next";
          allow_when_locked = true;
        };
        "XF86MonBrightnessUp" = {
          action = "spawn:brightnessctl --class=backlight set +10%";
          allow_when_locked = true;
        };
        "XF86MonBrightnessDown" = {
          action = "spawn:brightnessctl --class=backlight set 10%-";
          allow_when_locked = true;
        };
      };
    };
  };
}
