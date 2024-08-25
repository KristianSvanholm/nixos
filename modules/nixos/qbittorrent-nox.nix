{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [ qbittorrent-nox ];

    systemd = {
	packages = [pkgs.qbittorrent-nox];
	services."qbittorrent-nox@srv" = {
	    overrideStrategy = "asDropin";
	    wantedBy = ["multi-user.target"];
	};
    };
}
