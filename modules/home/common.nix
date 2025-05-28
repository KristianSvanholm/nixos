{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice
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
    nurl
    obsidian
  ];
}
