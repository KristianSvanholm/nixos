{ username, home_d, ...}:
{
    imports = [
        ../../modules/home/zsh.nix
        ../../modules/home/alacritty.nix
        ../../modules/home/common.nix
    ];

    home = {
        username = username;
        homeDirectory = home_d;
        sessionVariables = { EDITOR = "nvim"; };
    };

    programs = {
        home-manager.enable = true;
    };
    
    home.stateVersion = "24.05"; # Dont touch
}
