{ config, pkgs, ... }:
{
    # Home Manager needs a bit of information about you and the paths it should manage.
    home.username = "krs"; 
    home.homeDirectory = "/home/krs";

    imports = [ 
	../../modules/home/git.nix
	#../../modules/home/i3.nix
	../../modules/home/hyprland.nix
	../../modules/home/rofi.nix
	../../modules/home/flameshot.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your environment.
    home.packages = with pkgs; [ 
	firefox 
	pavucontrol 
	bat
	discord
	arandr
	fzf
	modrinth-app
	unzip
	qbittorrent
	zoom-us
	networkmanagerapplet
	mullvad-vpn
	vlc
	libreoffice
	teams-for-linux
	neofetch
	btop
	lf
	imv
	postman
	obsidian
	spotify
	ganttproject-bin
	wakeonlan
    ];

    programs = { 
	alacritty.enable = true;
	fastfetch.enable = true;
    };

    services.mpris-proxy.enable = true; # Bluetooth media controls

    home.file = {};

    home.sessionVariables = { 
	EDITOR = "nvim"; 
	WEBKIT_DISABLE_DMABUF_RENDERER = 1; 
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    stylix.targets = { 
	neovim.enable = false;
    };
  
}
