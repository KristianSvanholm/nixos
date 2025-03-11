{ ... }:
{

    virtualisation.oci-containers.containers = {
	nginx-proxy-manager = {
	    image = "jc21/nginx-proxy-manager:latest";
	    ports = [ "80:80" "81:81" "443:443" ];
	    volumes = [ "./data:/data" "./letsencrypt:/etc/letsencrypt" ];
	};	
    }; 

    networking.firewall.allowedTCPPorts = [ 80 81 443 ];

    services.traefik = {
	enable = false;
	staticConfigOptions = {
	    entryPoints = {
		web = {
		    address = ":80";
		    #asDefault = true;
		    /*http.redirections.entrypoint = {
			to = "websecure";
			scheme = "https";
		    };*/
		};
		websecure = {
		    address = ":443";
		    asDefault = true;
		    http.tls.certResolver = "letsencrypt";
		};

		log = {
		    level = "INFO";
		};
		api = {
		};
	    };
	};
    };
}
