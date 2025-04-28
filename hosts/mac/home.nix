{ pkgs, username, home_d, ...}:
{
    imports = [
        ../../modules/home/zsh.nix
        ../../modules/home/alacritty.nix
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
        discord
        spotify
        postman
        element-desktop
        cargo
    ];
    
    home.stateVersion = "24.05"; # Dont touch
}
