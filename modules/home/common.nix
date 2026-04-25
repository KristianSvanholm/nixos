{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    #(pkgs.discord.override {withMoonlight = true;})
    vlc
    imv
    #inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    nurl
  ];
}
