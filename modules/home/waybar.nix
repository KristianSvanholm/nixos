{ config, ... }:
{

    stylix.targets.waybar.enable = false;
    programs.waybar = {
	enable = true;
	settings = {
	    mainBar = {

		modules-left = [ "hyprland/workspaces" ]; 
		modules-center = [ "clock" ];
		modules-right = [ "pulseaudio" "bluetooth" "cpu" "memory" "temperature" "clock#date" ];

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
		};
	    };
	};
	style = ''
	
	* {
	    border: none;
	    border-radius: 0;
	    min-height: 0;
	    margin: 0px;
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

	#pulseaudio, #bluetooth, #cpu, #memory, #temperature, #clock.date {
	    border-bottom: 1px solid;
	}

	#pulseaudio {
	    color: #${config.lib.stylix.colors.base08};
	}

	#bluetooth {
	    color: #${config.lib.stylix.colors.base09};
	}

	#cpu {
	    color: #${config.lib.stylix.colors.base0A};
	}

	#memory {
	    color: #${config.lib.stylix.colors.base0B};
	}

	#temperature {
	    color: #${config.lib.stylix.colors.base0C};
	}

	#clock.date {
	    color: #${config.lib.stylix.colors.base0E};
	}

	'';
    };

}
