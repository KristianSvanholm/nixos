# Longhorn and NFS client prerequisites. Imported by every k3s node.
{
  config,
  lib,
  pkgs,
  ...
}: {
  services.openiscsi = {
    enable = true;
    # unique per node
    name = "iqn.2026-09.homelab.local:${lib.toLower config.networking.hostName}";
  };

  systemd.tmpfiles.rules = [
    # longhorn-manager nsenters to the host but keeps the container's PATH
    "d /usr/local 0755 root root -"
    "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
    "d /var/lib/longhorn 0755 root root -"
  ];

  # puts mount.nfs where mount(8) looks for it
  boot.supportedFilesystems.nfs = true;

  systemd.services.k3s = {
    # kubelet is what runs mount(8) and iscsiadm
    after = ["iscsid.service"];
    wants = ["iscsid.service"];
    path = with pkgs; [nfs-utils openiscsi util-linux e2fsprogs];
  };

  environment.systemPackages = with pkgs; [
    e2fsprogs # mkfs.ext4 for longhorn volumes
    cryptsetup
    nfs-utils
  ];

  networking.firewall = {
    allowedTCPPorts = [
      3260 # iSCSI
      8500 # longhorn conversion webhook
      8501 # longhorn admission webhook
      10250 # kubelet
    ];
    allowedTCPPortRanges = [
      {
        from = 9500; # longhorn-manager + engine/replica instance managers
        to = 9504;
      }
    ];
  };
}
