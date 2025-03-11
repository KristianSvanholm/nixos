{ inputs, pkgs, username, home, ... }:
{
    imports = [ 
	../../modules/home/git.nix
	../../modules/home/hyprland.nix
	../../modules/home/nvf.nix
	../../modules/home/zsh.nix
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
        ssh = {
            enable = true;
            extraConfig = ''
                Host *
                    IdentityAgent ~/.1password/agent.sock
            '';
        };
    };

    # Bluetooth media controls
    services.mpris-proxy.enable = true;
    
    # The home.packages option allows you to install Nix packages into your environment.
    home.packages = with pkgs; [ 
	discord
	networkmanagerapplet
	vlc
	libreoffice
	imv
	postman
	spotify
	wakeonlan
        vesktop
        element-desktop
        inputs.zen-browser.packages."${system}".default
    ];

    stylix.targets = {
        nvf.enable = false;
        btop.enable = false;
    };

    home.stateVersion = "24.05"; # Dont touch

}
