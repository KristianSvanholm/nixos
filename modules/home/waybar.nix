{ ... }:
{
    programs.waybar = {
	enable = true;
	settings = [{
	    /*mainbar = {
		layer = "bottom";
		position = "bottom"; 
		margin-bottom = -1;
	    };*/
	    modules-left = [ "hyprland/workspaces" ]; 
	    modules-right = [ "pulseaudio" "bluetooth" "cpu" "memory" "temperature" "clock" ];
	    pulseaudio = {
		format = "vol: {volume}%";
		on-click = "pavucontrol";
	    };
	    bluetooth = {
		on-click = "blueman-manager";
	    };
	    cpu = {
		format = "cpu: {usage}%";
	    };
	    memory = {
		format = "mem: {percentage}%";
	    };
	    clock = {
		format = "{:%d.%m.%Y   %H:%M}";
	    };
	}];
    };

}
