{ ... }:
{

    security.pam.services.hyprlock = {}; # Enable PAM

    programs.hyprlock = {
	enable = true;
	settings = {
	    general.hide_cursor = true;
	    background = [
		{
		    path = "screenshot";
		    blur_passes = 3;
		    blur_size = 8;
		}
	    ];
	};
    };

}
