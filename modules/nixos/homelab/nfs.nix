{
  config,
  lib,
  ...
}: let
  owner = config.users.users.${config.user.name};
  # the only nfs clients; both reserved in the router
  nodes = ["192.168.3.112" "192.168.3.91"];
  pods = "10.42.0.0/16";
  base = "rw,sync,no_subtree_check";
  exportTo = clients: opts: lib.concatMapStringsSep " " (c: "${c}(${opts})") clients;

  # no_root_squash because linuxserver entrypoints run as root before dropping
  # to PUID
  app = fsid: exportTo nodes "${base},no_root_squash,fsid=${toString fsid}";

  # squashed to the local user so jottad can read what longhorn writes as root
  squash = "${base},all_squash,anonuid=${toString owner.uid},anongid=${toString config.users.groups.${owner.group}.gid},fsid=5";
in {
  services.nfs.server = {
    enable = true;

    exports = ''
      /mnt/hdd/jelly ${app 1}
      /mnt/hdd/immich ${app 2}
      /mnt/hdd/attic ${app 3}
      /mnt/hdd/test-media ${app 4}
      /mnt/hdd/backups ${exportTo (nodes ++ [pods]) squash}
    '';
  };

  # every client is v4; v3 would also drag in rpcbind, statd and lockd
  services.nfs.settings.nfsd.vers3 = false;

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

  networking.firewall.allowedTCPPorts = [2049];
}
