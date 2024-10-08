{ config, pkgs, ... }:
{
    # Home Manager needs a bit of information about you and the paths it should manage.
    home.username = "krs"; 
    home.homeDirectory = "/home/krs";

    imports = [ 
	../../modules/home/git.nix
	#../../modules/home/i3.nix
	../../modules/home/rofi.nix
	../../modules/home/flameshot.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your environment.
    home.packages = with pkgs; [ 
	pavucontrol
	networkmanagerapplet
	bat
	discord
	arandr
	fzf
	unzip
    ];

    programs = { 
	alacritty.enable = true;
    };

    home.file = {};

    home.sessionVariables = { 
	EDITOR = "nvim"; 
	WEBKIT_DISABLE_DMABUF_RENDERER = 1; 
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    stylix.targets = { 
	nixvim.enable = false;
	neovim.enable = false;
    };
  
}
