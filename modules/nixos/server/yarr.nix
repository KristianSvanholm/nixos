{ pkgs, username, ... }:
{

    imports = [
	./qbittorrent-nox.nix
    ];

    users.groups.media.members = [ username "sonarr" "radarr" "qbittorrent" ];

    environment.systemPackages = with pkgs; [
	jellyfin
	jellyfin-web
	jellyfin-ffmpeg
    ];

    services.jellyfin = {
	enable = true;
	openFirewall = true; # 8096
    };

    services.jellyseerr = {
	enable = true;
	openFirewall = true; # 5055
    };

    services.qbittorrent = {
	enable = true;
	openFirewall = true;
	port  = 6969;
	group = "media";
    };

    services.radarr = {
	enable = true;
	openFirewall = true; # 7878
	group = "media";
    };

    services.sonarr = {
	enable = true;
	openFirewall = true; # 8989
	group = "media";
    };

    services.prowlarr = {
	enable = true;
	openFirewall = true; # 9696
    };

    nixpkgs.config.permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
	"aspnetcore-runtime-6.0.36"
    ];

}
