{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    vlc
    imv
    #inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    nurl
  ];
}
