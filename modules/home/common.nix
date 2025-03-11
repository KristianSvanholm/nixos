{ pkgs, inputs, ... }:
{

    home.packages = with pkgs; [
        discord 
        vlc
        postman
        imv
        spotify
        element-desktop
        inputs.zen-browser.packages."${system}".default
    ];
    
}
