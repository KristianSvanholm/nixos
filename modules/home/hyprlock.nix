{ ... }:
{

    programs.hyprlock = {
	enable = true;
	settings = {
	    general = { 
		hide_cursor = true;
		ignore_empty_input = true;
	    };

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
