{ pkgs, ... }:
{
    ######################
    # Under construction #
    ######################

    xsession.enable = true;
    xsession.windowManager.i3 = {
	enable = true;
	config = {
	    window.titlebar = false;
	    window.border = 1;
	    terminal = "alacritty";
	    menu = "rofi -modi drun,run -show drun";
	};
    };
}
