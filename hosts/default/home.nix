{ config, pkgs, ... }:
{
    # Home Manager needs a bit of information about you and the paths it should manage.
    home.username = "krs"; 
    home.homeDirectory = "/home/krs";

    imports = [ 
	../../modules/home-manager/git.nix
	#../../modules/home-manager/i3.nix
	../../modules/home-manager/rofi.nix
	../../modules/home-manager/nixvim.nix
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your environment.
    home.packages = with pkgs; [ 
	firefox 
	flameshot 
	pavucontrol 
	bat
	discord
	arandr
	zoxide
	fzf
	modrinth-app
	unzip
	qbittorrent
	zoom-us
    ];

    programs = { 
	alacritty.enable = true;
    };

    home.file = {};

    home.sessionVariables = { EDITOR = "nvim"; };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    stylix.targets = { 
	nixvim.enable = false;
    };
  
}
