{ config, pkgs, ... }:
{
    home.username = "srv";
    home.homeDirectory = "/home/srv";

    imports = [
	../../modules/home-manager/git.nix
	../../modules/home-manager/nixvim.nix
    ];

    home.stateVersion = "24.05";

    home.packages = with pkgs; [
	bat
	zoxide
	fzf
	unzip
	alacritty
    ];

    home.file = {};

    home.sessionVariables = { EDITOR = "nvim"; };

    programs.home-manager.enable = true;
}
