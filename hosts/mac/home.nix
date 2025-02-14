{ pkgs, username, home_d, ...}:
{
    imports = [
        ../../modules/home/git.nix
        ../../modules/home/nvf.nix
        ../../modules/home/zsh.nix
    ];

    home = {
        username = username;
        homeDirectory = home_d;
        sessionVariables = { EDITOR = "nvim"; };
    };

    programs = {
        home-manager.enable = true;
    };
    
    home.packages = with pkgs; [
        yabai
        skhd
    ];

    home.stateVersion = "24.05"; # Dont touch
}
