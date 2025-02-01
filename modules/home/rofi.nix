{ pkgs, ... }:
{
    
    home.packages = with pkgs; [rofi-power-menu];

    programs.rofi = {
	enable = true;
	package = pkgs.rofi-wayland; # This works on both xorg and wayland :D
	extraConfig = {
	    modi = ["drun" "window"];
	    show-icons = true;
	    display-drun = "λ";
	    display-window = "λ";
	    drun-display-format = "{icon} {name}";
	    window-display-format = "{icon} {name}";
	};
    };
}
