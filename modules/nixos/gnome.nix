{ ... }:
{
    services.xserver = {
	enable = true;
	displayManager.gdm.enable = true;
	displayManager.gnome.enable = true;
    };
}
