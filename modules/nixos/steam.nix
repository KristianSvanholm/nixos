{ pkgs, ... }:

{
    #steam
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in fw for steam remote play
        dedicatedServer.openFirewall = true; # Open ports in fw for Source dedicated server
        localNetworkGameTransfers.openFirewall = true; # Open ports in fw for steam local network game transfers
    };

    environment.systemPackages = with pkgs; [ gamemode ];
}
