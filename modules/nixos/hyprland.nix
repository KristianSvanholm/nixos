{ pkgs, ... }:
{

    imports = [
	../../modules/nixos/wayshot.nix
    ];

    programs.hyprland = {
	enable = true;
	xwayland.enable = true;
    };

    environment.sessionVariables = {
	WLR_NO_HARDWARE_CURSORS = "1"; # Prevents invisible cursor
	NIXOS_OZONE_WL = "1"; # Hints electron apps to use wayland
    };

    environment.systemPackages = with pkgs; [
	waybar
	(waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }) )
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    hardware = {
	graphics.enable = true;
	nvidia.modesetting.enable = true; # For Wayland compositors
    };
}
