{ spicePkgs, ... }:
{
    programs.spicetify = {
	enable = true;
	enableExtensions = with spicePkgs.extensions; [
	    adblock
	    shuffle
	];
	theme = spicePkgs.themes.catpuccin;
	colorScheme = "mocha";
    };

}
