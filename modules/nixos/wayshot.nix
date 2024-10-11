{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	wayshot
	slurp
	wl-clipboard
    ];
}
