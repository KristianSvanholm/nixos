{ pkgs, ... }:
{

    imports = [ 
        ./tmux.nix 
        ./eza.nix 
        ./zoxide.nix 
        ./btop.nix 
        ./git.nix 
        ./nvf.nix
    ];

    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;

	shellAliases = {
	    srv = "ssh krs@192.168.3.112";
	    # ping -c 1 [ip] && arp -n, to find mac addr
	    wake = "wakeonlan -i 192.168.3.112 6c:2b:59:cf:cf:50";
	    switch = "sudo nixos-rebuild switch";
	    test = "sudo nixos-rebuild test";

	    # For mc server
	    tmc = "sudo tmux -S /run/minecraft/winter-gaming.sock attach";
	    mcstart = "systemctl start minecraft-server-winter-gaming.service";
	    mcstop = "systemctl stop minecraft-server-winter-gaming.service";
	};

	history = {
	    size = 10000;
	    ignoreDups = true;
	};

	# Zsh config profiling
	#initExtraFirst = "zmodload zsh/zprof\n";
	#initExtra = "zprof\n";

	completionInit = ''
	    autoload -Uz compinit
	    for dump in ~/.zcompdump(N.mh+24); do
		compinit
	    done
	    compinit -C
	'';

	oh-my-zsh = {
	    enable = true;
	    plugins = [ "git" ];
	    theme = "fishy";
	};
    };

    # General terminal packages here
    home.packages = with pkgs; [
        stow
        lf
        bat
        fzf
        unzip
        wget
        ripgrep
    ];

}
