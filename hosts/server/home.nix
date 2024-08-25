{ config, pkgs, ... }:
{
    home.username = "srv";
    home.homeDirectory = "/home/srv";

    imports = [
	../../modules/home/git.nix
	../../modules/home/nixvim.nix
	../../modules/home/eza.nix
    ];

    home.stateVersion = "24.05";

    home.packages = with pkgs; [
	bat
	zoxide
	fzf
	unzip
    ];

    home.file = {};

    home.sessionVariables = { EDITOR = "nvim"; };

    programs.home-manager.enable = true;
}
