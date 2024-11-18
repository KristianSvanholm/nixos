{ pkgs, ... }:
{
    imports = [
	../../modules/home/git.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];

    home = {
	username = "srv";
	homeDirectory = "/home/srv";
	sessionVariables = { EDITOR = "nvim"; };
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
	bat
	fzf
	unzip
	btop
    ];

    home.stateVersion = "24.05";

}
