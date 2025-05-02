{ pkgs, ... }:

{
  stylix = {
	enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
  	image = ../../wallpapers/zen4k.png;
  	cursor.package = pkgs.bibata-cursors;
  	cursor.name = "Bibata-Modern-Ice";
  	cursor.size = 16;
  	fonts = {
	  monospace = {
		package = pkgs.nerd-fonts.jetbrains-mono;
		name = "JetBrainsMono Nerd font Mono";
	  };
	  sansSerif = {
		package = pkgs.dejavu_fonts;
		name = "DejaVu Sans";
	  };
	  serif = {
		package = pkgs.dejavu_fonts;
		name = "DejaVu Serif";
	  };
	  sizes = {
	    applications = 8;
	    terminal = 10;
	    desktop = 8;
	    popups = 8;
	  };
	};
  	autoEnable = true;
	homeManagerIntegration.followSystem = true;
        
        # Shut up build warning for thing I don't use
        targets.gnome-text-editor.enable = false;
  };
}
