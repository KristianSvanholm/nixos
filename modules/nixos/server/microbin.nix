{ ... }:
{
    services.microbin = {
        enable = true;
        settings = {
            MICROBIN_WIDE = true;
            MICROBIN_PORT = 3434;
        };
    };

    networking.firewall.allowedTCPPorts = [ 3434 ];
}
