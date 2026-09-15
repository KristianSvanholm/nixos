{inputs, ...}: {
  imports = [inputs.noctalia.homeModules.default];

  stylix.targets.noctalia.enable = false;

  programs.noctalia = {
    enable = true;
    systemd.enable = false;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Gruvbox";
        community_palette = "Murasaki";
        wallpaper_scheme = "m3-content";
        templates = {
          enable_builtin_templates = true;
          builtin_ids = ["umbriel" "ghostty"];
        };
      };

      shell = {
        corner_radius_scale = 0;
        font_family = "JetBrainsMono Nerd Font Mono";
        external_ip_enabled = true;
        password_style = "random";
        polkit_agent = true;
        screen_time_enabled = true;
        telemetry_enabled = true;
        screenshot.copy_to_clipboard = true;
        launcher = {
          categories = false;
          compact = true;
        };
      };

      bar.main = {
        position = "bottom";
        thickness = 28;
        radius = 0;
        background_opacity = 0.0;
        capsule_opacity = 0.97;
        capsule_padding = 3.0;
        capsule_radius = 0;
        padding = 0;
        font_family = "JetBrainsMono Nerd Font Mono";
        font_weight = 400;
        shadow = false;
        start = ["clock"];
        center = ["workspaces"];
        end = ["network" "bluetooth" "volume" "control-center" "session"];
      };

      widget = {
        workspaces.capsule_radius = 0;
        audio_visualizer.enabled = false;
        brightness.enabled = false;
        launcher.enabled = false;
        notifications.enabled = false;
        wallpaper.enabled = false;
      };

      wallpaper = {
        enabled = true;
        directory = "${../../../wallpapers}";
        default.path = "${../../../wallpapers}/atna-joy-final5-932BD.jpg";
        transition = ["honeycomb"];
      };

      location.auto_locate = true;

      nightlight.enabled = true;

      lockscreen = {
        blurred_desktop = true;
        fingerprint = false;
      };

      control_center.calendar = {
        show_events_card = false;
        show_week_numbers = true;
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@DP-2"
          "clock"
          "visualizer"
          "calendar"
          "media"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@DP-2" = {
            type = "login_box";
            output = "DP-2";
            cx = 1280.0;
            cy = 1139.0;
            box_width = 368.0;
            box_height = 70.0;
            placement_width = 2560.0;
            placement_height = 1440.0;
            rotation = 0.0;
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = true;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "compact";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = false;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = false;
              show_weather = true;
            };
          };
          "clock" = {
            type = "clock";
            output = "DP-2";
            cx = 1280.0;
            cy = 720.0;
            box_width = 528.0;
            box_height = 272.0;
            placement_width = 2560.0;
            placement_height = 1440.0;
            rotation = 0.0;
            settings = {
              background = false;
              clock_style = "digital";
              color = "on_surface";
              shadow = true;
            };
          };
          "visualizer" = {
            type = "audio_visualizer";
            output = "DP-2";
            cx = 192.0;
            cy = 1224.0;
            box_width = 320.0;
            box_height = 112.0;
            placement_width = 2560.0;
            placement_height = 1440.0;
            rotation = 0.0;
            settings = {
              background = false;
              bands = 32;
              centered = true;
              mirrored = true;
              reversed = true;
              show_when_idle = false;
            };
          };
          "calendar" = {
            type = "calendar";
            output = "DP-2";
            cx = 2320.0;
            cy = 275.0;
            box_width = 0.0;
            box_height = 0.0;
            placement_width = 2560.0;
            placement_height = 1440.0;
            rotation = 0.0;
            settings = {
              background = false;
              font_family = "JetBrainsMono Nerd Font Mono";
              show_events = false;
              show_week_numbers = true;
            };
          };
          "media" = {
            type = "media_player";
            output = "DP-2";
            cx = 189.0;
            cy = 1350.0;
            box_width = 0.0;
            box_height = 0.0;
            placement_width = 2560.0;
            placement_height = 1440.0;
            rotation = 0.0;
            settings = {
              background = false;
              hide_when_no_media = true;
              layout = "horizontal";
              shadow = true;
            };
          };
        };
      };
    };
  };
}
