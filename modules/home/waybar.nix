{
  config,
  pkgs,
  ...
}: {
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        margin-top = 5;
        margin-left = 10;
        margin-right = 10;
        modules-left = ["niri/workspaces"];
        modules-center = ["clock"];
        modules-right = ["custom/tailscale" "battery" "pulseaudio" "bluetooth" "network" "clock#date"];

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
          on-click = "better-control --bluetooth";
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "󰂱 {num_connections}";
        };
        "custom/tailscale" = {
          exec = pkgs.writeShellScript "waybar-tailscale" ''
            if ${pkgs.tailscale}/bin/tailscale status --json 2>/dev/null | ${pkgs.jq}/bin/jq -e '.Self.Online' >/dev/null 2>&1; then
              echo '{"text": "󰕥", "tooltip": "'"$(${pkgs.tailscale}/bin/tailscale ip -4 2>/dev/null)"'"}'
            else
              echo '{"text": "", "tooltip": ""}'
            fi
          '';
          on-click = "${pkgs.tailscale}/bin/tailscale down";
          return-type = "json";
          interval = 10;
        };
        network = {
          format-wifi = "{icon} {ipaddr}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "󰈀 {ipaddr}";
          on-click = "better-control --wifi";
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
      #custom-tailscale,
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
          background-color: #${config.tint};
          color: #${config.lib.stylix.colors.base00};
      }

    '';
  };
}
