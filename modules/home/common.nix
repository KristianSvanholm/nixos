{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    alacritty
    libreoffice
    drawio
    discord
    vlc
    postman
    imv
    inputs.zen-browser.packages."${system}".default
    nurl
  ];
}
