{ ... }:
{

    programs.hyprlock = {
	enable = true;
	settings = {
	    general = { 
		hide_cursor = true;
		ignore_empty_input = true;
	    };
	    background = [{
		path = "screenshot"; # Does not work
		blur_passes = 3;
		blur_size = 8;
	    }];

	    input-field = [{
		monitor = "DP-2";
		size = "100, 50";
		position = "0, -500";
		halign = "center";
		valign = "center";
	    }];
    
	    # Does not work
	    label = [{
		monitor = "DP-2";
		text = "$TIME";
		text_align = "center";
		halign = "right";
		valign = "bottom";
	    }];
	};
    };

}
