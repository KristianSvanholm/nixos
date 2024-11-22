{ ... }:
{
    programs.btop = {
	enable = true;
	settings = {
	    theme_background = false;
	    rounded_corners = true;
	    graph_symbol = "braille";
	    update_ms = 100;
	};
    };
}
