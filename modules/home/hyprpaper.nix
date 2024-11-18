{ pkgs, lib, ... }:
{

    home.packages = with pkgs; [
	hyprpaper
    ];

    services.hyprpaper = {
	enable = lib.mkForce true;
	settings = { 
	    ipc = "on";
	    preload = [ "/home/krs/nixos/wallpapers/blue_waves.png" ];
	    wallpaper = [
		" , /home/krs/nixos/wallpapers/blue_waves.png"
	    ];
	};

    };
    
}
