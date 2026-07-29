{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.proton-cachyos.overlays.default];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in fw for steam remote play
    dedicatedServer.openFirewall = true; # Open ports in fw for Source dedicated server
    localNetworkGameTransfers.openFirewall = true; # Open ports in fw for steam local network game transfers
    extraCompatPackages = [
      pkgs.proton-ge-bin
      pkgs.proton-cachyos
    ];
    gamescopeSession.enable = true;
  };

  services.scx.enable = true;
  services.scx.scheduler = "scx_lavd";
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
}
