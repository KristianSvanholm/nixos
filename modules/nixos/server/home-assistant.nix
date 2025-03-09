{ ... }:
{
    
    services.home-assistant = {
	enable = true;
	openFirewall = true;
	extraComponents = [
	    "default_config"
	    "met"
	    "esphome"
	    "mobile_app"
	    "jellyfin"
	    "sonarr"
	    "radarr"
	    "qbittorrent"
	    "adguard"
	    "cpuspeed"
	];
	config = {
	    default_config = {};
	    homeassistant = {
		unit_system = "metric";
		temperature_unit = "C";
		name = "Home";
	    };
	    http = {
		use_x_forwarded_for = true;
		trusted_proxies = [ "10.88.0.4" ];
	    };
	};
    };
}
