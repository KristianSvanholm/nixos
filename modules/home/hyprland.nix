{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar.nix
    ./rofi.nix
    ./gtk.nix
    ./mako.nix
    ./grim.nix
  ];

  options.hyprland = {
    layout = lib.mkOption {
      type = lib.types.str;
      description = "hyprland layout";
      default = "dwindle";
    };
    animations = lib.mkOption {
      type = lib.types.bool;
      description = "enable or disable hyprland animations";
      default = false;
    };
  };

  config = {
    stylix.targets.hyprland.enable = false;

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      systemd = {
        enable = true;
        variables = ["--all"];
      };

      settings = {
        input = {
          kb_layout = "no";
          follow_mouse = 1;
        };

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgb(${config.lib.stylix.colors.${config.tint}})";
          layout = config.hyprland.layout;
        };
        scrolling = {
          fullscreen_on_one_column = false;
          column_width = 0.667;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;

          enable_swallow = true;
          swallow_regex = "^(Alacritty)$";
          swallow_exception_regex = "^vi.*$";
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        decoration = {
          rounding = 0;
          blur.enabled = false;
          shadow.enabled = false;

          active_opacity = 1;
          inactive_opacity = 1;
        };

        cursor = {
          no_hardware_cursors = true;
        };

        animations = {
          enabled = config.hyprland.animations;

          # niri-like spring animations
          bezier = [
            "easeOutQuint, 0.22, 1, 0.36, 1"
            "spring, 0.3, 0.9, 0.1, 1.05"
            "gentleFade, 0.25, 0.8, 0.25, 1"
          ];

          animation = [
            # workspace switch: instant
            "workspaces, 0"

            # layer surfaces (rofi, waybar, etc.): instant
            "layers, 0"
            "fadeLayers, 0"

            # window open: quick fade + slight upscale
            "windowsIn, 1, 4, gentleFade, popin 85%"

            # window close: quick fade out + slight shrink
            "windowsOut, 1, 3, gentleFade, popin 85%"

            # window move/resize: snappy spring
            "windowsMove, 1, 3, spring, slide"

            # fade: instant
            "fadeIn, 0"
            "fadeOut, 0"

            # border color transitions
            "border, 1, 4, easeOutQuint"
          ];
        };

        exec-once = ["waybar" "${pkgs._1password-gui}/bin/1password --silent"];

        windowrule = [
          "border_size 0, match:float 0, match:workspace w[tv1]"

          "float on, match:class 1password"
          "center on, match:class 1password"

          "float on, match:class .blueman-manager-wrapped"
          "center on, match:class .blueman-manager-wrapped"

          "float on, match:class org.pulseaudio.pavucontrol"
          "center on, match:class org.pulseaudio.pavucontrol"

          "float on, match:class keymapp"
          "center on, match:class keymapp"

          "workspace special:magic, match:class discord"
          "pseudo on, match:workspace name:special:magic"
        ];

        monitor = [
          ", highrr, auto, 1"
        ];

        bind = [
          # See https://wiki.hyprland.org/Configuring/Keywords/
          # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
          "SUPER, RETURN, exec, alacritty"
          "SUPER, Q, killactive,"
          "SUPER, F, fullscreen"
          "SUPER, TAB, exec, grim -g \"$(slurp)\" - | wl-copy"
          "SUPER, SPACE, exec, 1password --quick-access"
          "SUPER, E, exec, nautilus"
          "SUPER, Z, exec, firefox"
          "SUPER, X, exec, hyprlock"
          "SUPER, V, togglefloating,"
          "SUPER, D, exec, rofi -show drun"

          "SUPER, B, exec, pkill waybar || waybar"

          "SUPER, P, pseudo," # dwindle

          # Switch workspaces with mod + [0-9]
          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
          "SUPER, 4, workspace, 4"
          "SUPER, 5, workspace, 5"

          # Move active window to a workspace with mod + SHIFT + [0-9]
          "SUPER SHIFT, 1, movetoworkspace, 1"
          "SUPER SHIFT, 2, movetoworkspace, 2"
          "SUPER SHIFT, 3, movetoworkspace, 3"
          "SUPER SHIFT, 4, movetoworkspace, 4"
          "SUPER SHIFT, 5, movetoworkspace, 5"

          # Example special workspace (scratchpad)
          "SUPER, S, togglespecialworkspace, magic"
          "SUPER SHIFT, S, movetoworkspace, special:magic"

          # Move focus
          "SUPER, H, movefocus, l"
          "SUPER, L, movefocus, r"
          "SUPER, K, movefocus, u"
          "SUPER, J, movefocus, d"

          # Move window
          "SUPER SHIFT, H, movewindow, l"
          "SUPER SHIFT, L, movewindow, r"
          "SUPER SHIFT, K, movewindow, u"
          "SUPER SHIFT, J, movewindow, d"

          # Resize window
        ] ++ lib.optionals (config.hyprland.layout != "scrolling") [
          "SUPER CTRL, L, resizeactive, 50 0"
          "SUPER CTRL, H, resizeactive, -50 0"
          "SUPER CTRL, K, resizeactive, 0 -50"
          "SUPER CTRL, J, resizeactive, 0 50"
        ] ++ lib.optionals (config.hyprland.layout == "scrolling") [
          # Cycle column width
          "SUPER, T, layoutmsg, colresize +conf"
        ];

        bindm = [
          # Move/resize windows with mod + LMB/RMB and dragging
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];
      };
    };
  };
}
