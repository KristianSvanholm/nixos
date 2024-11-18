{ pkgs, ... }:
{
    imports = [ 
	../../modules/home/git.nix
	../../modules/home/hyprland.nix
	../../modules/home/rofi.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];
 
    # Important
    home = {
	username = "krs"; 
	homeDirectory = "/home/krs";
	EDITOR = "nvim";
	WEBKIT_DISABLE_DMABUF_RENDERER = 1;
    };

    programs = { 
	alacritty.enable = true;
	fastfetch.enable = true;
	home-manager.enable = true; # Let Home Manager manage itself
    };

    # Bluetooth media controls
    services.mpris-proxy.enable = true;
    
    stylix.targets.neovim.enable = false;

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

    home.stateVersion = "24.05"; # Dont touch

}
