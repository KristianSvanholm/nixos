{ pkgs, ... }:
{
    programs.rofi = {
	enable = true;
	package = pkgs.rofi-wayland; # This needs to be removed if on x11
	extraConfig = {
	    modi = "drun";
	    show-icons = true;
	    display-drun = "λ";
	    drun-display-format = "{icon} {name}";
	};
    };
}
