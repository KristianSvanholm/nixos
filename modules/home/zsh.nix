{ ... }:
{

    imports = [ ./eza.nix ./zoxide.nix ./thefuck.nix ];

    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;

	shellAliases = {
	    srv = "ssh srv@192.168.3.112";
	    wake = "wakeonlan -i 192.168.3.112 6c:2b:59:cf:cf:50";
	    switch = "sudo nixos-rebuild switch";
	    test = "sudo nixos-rebuild test";
	    tmc = "sudo tmux -S /run/minecraft/winter-gaming.sock attach";
	};

	history = {
	    size = 10000;
	    ignoreDups = true;
	};

	oh-my-zsh = {
	    enable = true;
	    plugins = [ "git" "thefuck" ];
	    theme = "fishy";
	};
    };    

}
