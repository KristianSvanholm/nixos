{ pkgs, username, home, ... }:
{
    imports = [
	../../modules/home/git.nix
	../../modules/home/nixvim.nix
	../../modules/home/zsh.nix
    ];

    home = {
	username = username;
	homeDirectory = home;
	sessionVariables = { EDITOR = "nvim"; };
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
	bat
	fzf
	unzip
    ];

    home.stateVersion = "24.05";

}
