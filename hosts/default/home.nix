{ pkgs, username, home, ... }:
{
    imports = [ 
	../../modules/home/git.nix
	../../modules/home/hyprland.nix
	../../modules/home/nvf.nix
	../../modules/home/zsh.nix
        ../../modules/home/modrinth.nix
    ];
 
    # Important
    home = {
	username = username; 
	homeDirectory = home;
	sessionVariables = {
	    EDITOR = "nvim";
	    WEBKIT_DISABLE_DMABUF_RENDERER = 1;
	};
    };

    programs = { 
	alacritty.enable = true;
	fastfetch.enable = true;
	home-manager.enable = true; # Let Home Manager manage itself
    };

    # Bluetooth media controls
    services.mpris-proxy.enable = true;
    
    # The home.packages option allows you to install Nix packages into your environment.
    home.packages = with pkgs; [ 
	firefox 
	pavucontrol 
	bat
	discord
	arandr
	fzf
	unzip
	networkmanagerapplet
	mullvad-vpn
	vlc
	libreoffice
	neofetch
	lf
	imv
	postman
	spotify
	wakeonlan
	qbittorrent
	zoom-us
    ];

    home.stateVersion = "24.05"; # Dont touch

}
