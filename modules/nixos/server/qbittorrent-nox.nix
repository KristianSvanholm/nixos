{ pkgs, username, ... }:
{
    environment.systemPackages = with pkgs; [ qbittorrent-nox ];

    systemd = {
	packages = [pkgs.qbittorrent-nox];
	services."qbittorrent-nox@${username}" = {
	    overrideStrategy = "asDropin";
	    wantedBy = ["multi-user.target"];
	};
    };
}
