{ ... }:
{

    stylix.targets.waybar.enable = false;
    programs.waybar = {
	enable = true;
	settings = {
	    mainBar = {

		modules-left = [ "hyprland/workspaces" ]; 
		modules-center = [ "clock" ];
		modules-right = [ "pulseaudio" "bluetooth" "cpu" "memory" "temperature" "clock#date" ];

		"hyprland/workspaces" = {

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
	    border-bottom: 1px solid #e4e4e4;
	}

	.modules-right * {
	    margin-left: 3px;
	    margin-right: 3px;
	}

	#pulseaudio, #bluetooth, #cpu, #memory, #temperature, #clock.date {
	    border-bottom: 1px solid #e4e4e4;
	}

	'';
    };

}
