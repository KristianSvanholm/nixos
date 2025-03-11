{ ... }:
{
    
    services.immich = {
	enable = true;
	openFirewall = true;
	mediaLocation = "/mnt/hdd/immich";
	host = "0.0.0.0";
	#accelerationDevices = null;
    };

    users.users.immich.extraGroups = [ "video" "render" ];

}
