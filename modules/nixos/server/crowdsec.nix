{ pkgs, inputs, lib, ... }:
{

    services.crowdsec = let
        yaml = (pkgs.formats.yaml {}).generate;
        acquisitions_file = yaml "acquisitions.yaml" {
            filenames = ["/data/logs/*.log"];
            labels.type = "nginx-proxy-manager-logs";
        };
    in {
        enable = true;
        enrollKeyFile = "/mnt/hdd/enroll.key";
        settings = {
            common = {
                log_media = "file";
                log_level = "info";
                log_dir = "/var/log/";
            };
            crowdsec_service.acquisition_path = acquisitions_file;
            api.server = {
                listen_uri = "127.0.0.1:8080";
                log_level = "info";
            };
        };
    };

    networking.firewall.allowedTCPPorts = [ 8080 ];

    nixpkgs.overlays = [inputs.crowdsec.overlays.default];
    services.crowdsec-firewall-bouncer = {
        enable = true;
        settings = {
            log_level = "debug";
            api_key = "secret";
            api_url = "127.0.0.1:8080";
        };
    };

    systemd.services.crowdsec.serviceConfig.ExecStartPre = let
        script = pkgs.writeScriptBin "install" ''
            #!${pkgs.runtimeShell}

            set -euo pipefail

            ## Collections

            # Core Linux support
            if ! cscli collections list | grep -q "linux"; then
                cscli collections install crowdsecurity/linux
            fi

            # nginx-proxy-manager
            if ! cscli collections list | grep -q "nginx-proxy-manager"; then
                cscli collections install crowdsecurity/nginx-proxy-manager
            fi

            ## Bouncers

            # Firewall bouncer
            if ! cscli bouncers list | grep -q "firewall-bouncer"; then
                cscli bouncers add "firewall-bouncer" --key "secret"
            fi

            chown -R crowdsec:crowdsec /var/lib/crowdsec
        '';
    in ["${script}/bin/install"];

}
