{ config, ... }:
{

    stylix.targets.hyprlock.enable = false;

    programs.hyprlock = {
	enable = true;

	settings = {
	    general = { 
		hide_cursor = true;
		ignore_empty_input = true;
	    };

	    background = {
		path = "${config.stylix.image}";
	    };

	    input-field = {
		monitor = ["DP-1" "HDMI-A-1"];
		size = "150, 30";
		position = "0, -500";
		font_family = config.stylix.fonts.sansSerif.name;
		check_color = "rgb(${config.lib.stylix.colors.base0B})";
		fail_color = "rgb(${config.lib.stylix.colors.base09})";
		rounding = 0;
		outline_thickness = 1;
	    };

	    label = [{
		text = "$TIME";
		position ="0, 0";
		font_family = config.stylix.fonts.sansSerif.name;
		font_size = 95;
		halign = "center";
		valign = "center";
	    }];
	};
    };

}
