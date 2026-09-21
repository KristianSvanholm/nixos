{...}: {
  services.nfs.server = {
    enable = true;
    # pinned so the firewall rules below are enough
    statdPort = 4000;
    lockdPort = 4001;
    mountdPort = 4002;

    # longhorn-manager is not host-networked, so it mounts the backupstore from
    # the pod network. Only that subtree is exported to it.
    exports = ''
      /mnt/hdd 192.168.3.0/24(rw,sync,no_subtree_check,no_root_squash,insecure)
      /mnt/hdd/backups/longhorn 192.168.3.0/24(rw,sync,no_subtree_check,no_root_squash,insecure) 10.42.0.0/16(rw,sync,no_subtree_check,no_root_squash,insecure)
    '';
  };

  # backup roots; jotta-cli backs /mnt/hdd/backups up offsite
  systemd.tmpfiles.rules = [
    "d /mnt/hdd/backups 0755 root root -"
    "d /mnt/hdd/backups/longhorn 0755 root root -"
    "d /mnt/hdd/backups/postgres 0755 root root -"
    # written by the pg-dump jobs, which run as the namespace's own user
    "d /mnt/hdd/backups/postgres/attic 2770 attic attic -"
    "d /mnt/hdd/backups/postgres/immich 2770 immich immich -"
  ];

  networking.firewall = {
    allowedTCPPorts = [
      111 # rpcbind
      2049 # nfs
      4000 # statd
      4001 # lockd
      4002 # mountd
    ];
    allowedUDPPorts = [111 2049 4000 4001 4002];
  };
}
