{ config, pkgs, ... }:
{
    home.username = "srv";
    home.homeDirectory = "/home/srv";

    imports = [
	../../modules/home/git.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];

    home.stateVersion = "24.05";

    home.packages = with pkgs; [
	bat
	fzf
	unzip
	btop
    ];

    home.file = {};

    home.sessionVariables = { EDITOR = "nvim"; };

    programs.home-manager.enable = true;
}
