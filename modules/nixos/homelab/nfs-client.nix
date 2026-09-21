{...}: let
  server = "192.168.3.112";
  # automounted; the homelab is not always up
  share = name: {
    device = "${server}:/mnt/hdd/${name}";
    fsType = "nfs";
    options = [
      "vers=4.2"
      "_netdev"
      "noauto"
      "x-systemd.automount"
      "x-systemd.mount-timeout=10"
      "x-systemd.idle-timeout=600"
    ];
  };
in {
  fileSystems = {
    "/mnt/jelly" = share "jelly";
    "/mnt/share" = share "share";
  };
}
