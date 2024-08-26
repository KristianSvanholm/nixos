{ ... }:
{

    imports = [ ./eza.nix ./zoxide.nix ];

    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;

	shellAliases = {
	    srv = "ssh srv@192.168.3.112";
	    switch = "sudo nixos-rebuild switch";
	};

	history = {
	    size = 10000;
	};
    };    

}
