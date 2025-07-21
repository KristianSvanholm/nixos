{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./qbittorrent-nox.nix
  ];

  users.groups.media.members = [config.user.name "sonarr" "radarr" "qbittorrent"];

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
    port = 6969;
    group = "media";
  };

  services.sabnzbd = {
    enable = true;
    openFirewall = true; # 8080
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

  services.bazarr = {
    enable = true;
    openFirewall = true; # 6767
    group = "media";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true; # 9696
  };

  #virtualisation.oci-containers.containers = {
  #    kapowarr = {
  #        image = "mrcas/kapowarr";
  #        ports = [ "5656:5656" ];
  #        volumes = [
  #    	"/var/lib/kapowarr-db:/app/db"
  #    	"/mnt/hdd/jelly/torrents/comics:/app/temp_downloads"
  #    	"/mnt/hdd/jelly/media/comics:/comics-1"
  #        ];
  #    };
  #};
}
