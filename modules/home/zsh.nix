{ ... }:
{

    imports = [ ./eza.nix ];

    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;

	shellAliases = {
	    ls = "eza --icons --no-quotes";
	    ll = "eza --icons --no-quotes -l";
	    srv = "ssh srv@192.168.3.112";
	    switch = "sudo nixos-rebuild switch";
	};

	history = {
	    size = 10000;
	};
    };    

}
