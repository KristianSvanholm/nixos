{ pkgs, lib, home, ... }:
{

    stylix.targets.hyprpaper.enable = lib.mkForce false;

    home.packages = with pkgs; [
	hyprpaper
    ];

    services.hyprpaper = {
	enable = lib.mkForce true;
	settings = { 
	    ipc = "on";
	    preload = [ "${home}/nixos/wallpapers/green_leafs.png" ];
	    wallpaper = [
		" , ${home}/nixos/wallpapers/green_leafs.png"
	    ];
	};

    };
    
}
