{config, ...}: {
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["battery" "pulseaudio" "bluetooth" "cpu" "memory" "temperature" "clock#date"];

        battery = {
          format = "{capacity}%";
        };
        pulseaudio = {
          format = "vol: {volume}%";
          on-click = "pavucontrol";
        };
        bluetooth = {
          on-click = "blueman-manager";
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "󰂱 {num_connections}";
        };
        cpu = {
          format = "󰍛 {usage}%";
        };
        memory = {
          format = "mem: {percentage}%";
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

      tooltip {
          opacity: 0.9
      }

      #window {
          color: #e4e4e4;
      }

      #workspaces {
          padding: 0px;
          margin: 0px;
      }

      #workspaces button {
          padding: 0 2px;
          margin: 0px;
      }

      #workspaces button.active {
          border-bottom: 1px solid;
      }

      .modules-right * {
          margin-left: 3px;
          margin-right: 3px;
      }

      #battery, #pulseaudio, #bluetooth, #cpu, #memory, #temperature, #clock.date {
          border-bottom: 1px solid;
      }

      #battery {
          color: #${config.lib.stylix.colors.base08};
      }

      #pulseaudio {
          color: #${config.lib.stylix.colors.base09};
      }

      #bluetooth {
          color: #${config.lib.stylix.colors.base0A};
      }

      #cpu {
          color: #${config.lib.stylix.colors.base0B};
      }

      #memory {
          color: #${config.lib.stylix.colors.base0C};
      }

      #temperature {
          color: #${config.lib.stylix.colors.base0D};
      }

      #clock.date {
          color: #${config.lib.stylix.colors.base0E};
      }

    '';
  };
}
