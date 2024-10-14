{ ... }:
{
    services.hyprpaper = {
	enable = true;
	settings = { 
	    ipc = "on";
	    preload = [ "../../wallpapers/astro.jpg" ];
	    wallpaper = ["DP-2,../../wallpapers/astro.jpg"];	    
	};

    };
    
}
