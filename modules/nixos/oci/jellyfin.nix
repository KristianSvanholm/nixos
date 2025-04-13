{ ... }:
{
    virtualisation.oci-containers.containers = {
        jellyfin = {
            image = "jellyfin/jellyfin:latest";
            networks = [ "proxy" ];
            devices = [ "/dev/dri:/dev/dri" ];
            volumes = [ 
                "/home/krs/config/jellyfin/:/config"
                "/var/jellyfin/cache/:/cache"
                "/mnt/hdd/jelly/media/tv:/tv:ro"
                "/mnt/hdd/jelly/media/movies:/movies:ro"
            ];
            labels = {
                "traefik.enable"="true";                                                     
                "traefik.http.routers.jellyfin.entrypoints"="http";
                "traefik.http.routers.jellyfin.rule"="Host(`jelly.kristian.rs`)";
                "traefik.http.middlewares.jellyfin-https-redirect.redirectscheme.scheme"="https";
                "traefik.http.routers.jellyfin.middlewares"="jellyfin-https-redirect";
                "traefik.http.routers.jellyfin-secure.entrypoints"="https";
                "traefik.http.routers.jellyfin-secure.rule"="Host(`jelly.kristian.rs`)";
                "traefik.http.routers.jellyfin-secure.tls"="true";
                "traefik.http.routers.jellyfin-secure.service"="jellyfin";
                "treafik.http.services.jellyfin.loadbalancer.server.port"="8096";
                "traefik.docker.network"="proxy";
            };
        };
    };
}
