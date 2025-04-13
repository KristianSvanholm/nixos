{ ... }:
{
    virtualisation.oci-containers.backend = "docker";
    virtualisation.oci-containers.containers = {
        traefik = {
            image = "traefik:latest";
            ports = ["80:80" "443:443"];
            #extraOptions = ["--network=traefik"];
            networks = [ "proxy" ];
            volumes = [ 
                "/home/krs/nixos/config/traefik/traefik.yaml:/traefik.yaml:ro"
                "/home/krs/nixos/config/traefik/config.yaml:/config.yaml:ro"
                "/etc/localtime:/etc/localtime:ro"
                "/var/run/docker.sock:/var/run/docker.sock:ro"
                "/var/traefik/acme.json:/acme.json"
                "/var/log/traefik:/var/log/traefik"
            ];
            labels = {
                "traefik.enable"="true";                                                     
                "traefik.http.routers.traefik.entrypoints"="http";
                "traefik.http.routers.traefik.rule"="Host(`traefik.kristian.rs`)";
                "traefik.http.middlewares.traefik-https-redirect.redirectscheme.scheme"="https";
                "traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto"="https";
                "traefik.http.routers.traefik.middlewares"="traefik-https-redirect";
                "traefik.http.routers.traefik-secure.entrypoints"="https";
                "traefik.http.routers.traefik-secure.rule"="Host(`traefik.kristian.rs`)";
                "traefik.http.routers.traefik-secure.tls"="true";
                "traefik.http.routers.traefik-secure.tls.certresolver"="cloudflare";
                "traefik.http.routers.traefik-secure.tls.domains[0].main"="kristian.rs";
                "traefik.http.routers.traefik-secure.tls.domains[0].sans"="*.kristian.rs";
                "traefik.http.routers.traefik-secure.service"="api@internal";
            };
        };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
}
