{ username, home, ... }:
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

    stylix.targets = {
	btop.enable = false;
    };

    home.stateVersion = "24.05";

}
