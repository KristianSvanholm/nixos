{config, ...}: {
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        margin-top = 5;
        margin-left = 10;
        margin-right = 10;
        modules-left = ["hyprland/workspaces" "niri/workspaces"];
        modules-center = ["clock"];
        modules-right = ["battery" "pulseaudio" "bluetooth" "network" "clock#date"];

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 5;
          };
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}";
          format-icons = ["󰕿" "󰖀" "󰕾"];
          on-click = "pavucontrol";
        };
        bluetooth = {
          on-click = "blueman-manager";
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "󰂱 {num_connections}";
        };
        network = {
          format-wifi = "{icon} {ipaddr}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "󰈀 {ipaddr}";
          on-click = "nm-connection-editor";
        };
        clock = {
          format = "{:%H:%M}";
        };
        "clock#date" = {
          format = "{:%d.%m.%Y}";
          tooltip-format = "{calendar}";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ffead3'><b>{}</b></span>";
              weeks = "<span color='#${config.lib.stylix.colors.base0C}'><b>W{}</b></span>";
              weekdays = "<span color='#${config.lib.stylix.colors.base09}'><b>{}</b></span>";
              today = "<span color='#${config.lib.stylix.colors.base0B}'><b><u>{}</u></b></span>";
            };
          };
        };
      };
    };
    style = ''

      * {
          font-family: ${config.stylix.fonts.monospace.name};
          border: none;
          border-radius: 0;
          min-height: 0;
          margin: 0px;
      }

      window#waybar {
          background: transparent;
      }

      tooltip {
          opacity: 0.9;
      }

      #workspaces,
      #clock,
      #battery,
      #pulseaudio,
      #bluetooth,
      #network,
      #clock.date {
          background-color: #${config.lib.stylix.colors.base00};
          padding: 0 6px;
          margin: 0 2px;
      }

      #window {
          color: #e4e4e4;
      }

      #workspaces {
          padding: 0px;
      }

      #workspaces button {
          padding: 0 2px;
          margin: 0px;
      }

      #workspaces button.active {
          background-color: #${config.lib.stylix.colors.${config.tint}};
          color: #${config.lib.stylix.colors.base00};
      }

    '';
  };
}
