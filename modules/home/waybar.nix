{ ... }:
{
    programs.waybar = {
	enable = true;
	settings = [{
	    mainbar = {
		layer = "bottom";
		position = "bottom"; 
		margin-bottom = -1;
	    };
	    modules-left = [ "hyprland/workspaces" ]; 
	    modules-right = [ "cpu" "memory" "temperature" "clock" ];
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
