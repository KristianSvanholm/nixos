{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice
    drawio
    discord
    vlc
    postman
    imv
    inputs.zen-browser.packages."${system}".default
    kdePackages.dolphin
    nurl
  ];
}
