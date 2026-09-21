{config, ...}: let
  owner = config.users.users.${config.user.name};
  lan = "192.168.3.0/24";
  pods = "10.42.0.0/16";
  base = "rw,sync,no_subtree_check,insecure";

  # no_root_squash because linuxserver entrypoints run as root before dropping
  # to PUID
  app = fsid: "${lan}(${base},no_root_squash,fsid=${toString fsid})";

  # squashed to the local user so jottad can read what longhorn writes as root
  squash = "${base},all_squash,anonuid=${toString owner.uid},anongid=${toString config.users.groups.${owner.group}.gid},fsid=5";
in {
  services.nfs.server = {
    enable = true;
    # pinned so the firewall rules below are enough
    statdPort = 4000;
    lockdPort = 4001;
    mountdPort = 4002;

    exports = ''
      /mnt/hdd/jelly ${app 1}
      /mnt/hdd/immich ${app 2}
      /mnt/hdd/attic ${app 3}
      /mnt/hdd/test-media ${app 4}
      /mnt/hdd/backups ${lan}(${squash}) ${pods}(${squash})
    '';
  };

  systemd.tmpfiles.rules = let
    o = "${config.user.name} ${owner.group}";
  in [
    # root-owned, or tmpfiles refuses to descend into the rules below
    "d /mnt/hdd 0775 root ${owner.group} -"
    "d /mnt/hdd/backups 0755 ${o} -"
    "d /mnt/hdd/backups/longhorn 0755 ${o} -"
    "d /mnt/hdd/backups/postgres 0755 ${o} -"
    "d /mnt/hdd/backups/postgres/attic 0755 ${o} -"
    "d /mnt/hdd/backups/postgres/immich 0755 ${o} -"
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
