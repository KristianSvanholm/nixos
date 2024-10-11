{ pkgs, ... }:
{
    programs.rofi = {
	enable = true;
	package = pkgs.rofi-wayland; # This works on both xorg and wayland :D
	extraConfig = {
	    modi = "drun";
	    show-icons = true;
	    display-drun = "λ";
	    drun-display-format = "{icon} {name}";
	};
    };
}
