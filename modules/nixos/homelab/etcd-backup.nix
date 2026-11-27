{
  config,
  pkgs,
  ...
}: let
  owner = config.users.users.${config.user.name};
  src = "/var/lib/rancher/k3s/server/db/snapshots";
  dst = "/mnt/hdd/backups/etcd";
in {
  systemd.services.etcd-snapshot-sync = {
    unitConfig.RequiresMountsFor = "/mnt/hdd";
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.rsync}/bin/rsync -a --delete --chmod=D0755,F0640 \
        --chown=${config.user.name}:${owner.group} ${src}/ ${dst}/
    '';
  };

  systemd.timers.etcd-snapshot-sync = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "*-*-* 00/12:30:00";
      Persistent = true;
    };
  };
}
