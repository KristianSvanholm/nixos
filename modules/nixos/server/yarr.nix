{ username, ... }:
{

    users.groups.media.members = [ username "radarr" "sonarr" "prowlarr"];

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
}
