{ ... }:
{
    stylix.targets.btop.enable = false;

    programs.btop = {
	enable = true;
	settings = {
	    color_theme = "gruvbox_dark_v2";
	    theme_background = false;
	    rounded_corners = true;
	    graph_symbol = "braille";
	    update_ms = 100;
	};
    };
}
