{ ... }:
{
    
    services.immich = {
	enable = true;
	openFirewall = true;
	mediaLocation = "/mnt/hdd/immich";
	host = "192.168.3.112";
	#accelerationDevices = null;
    };

    users.users.immich.extraGroups = [ "video" "render" ];

}
