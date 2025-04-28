{ pkgs, inputs, ... }:
{

    home.packages = with pkgs; [
        protonmail-desktop
        drawio
        discord 
        vlc
        postman
        imv
        element-desktop
        inputs.zen-browser.packages."${system}".default
        kdePackages.dolphin
        kdePackages.qtsvg
    ];
    
}
