{...}: {
  services.nfs.server = {
    enable = true;
    # pinned so the firewall rules below are enough
    statdPort = 4000;
    lockdPort = 4001;
    mountdPort = 4002;

    exports = ''
      /mnt/hdd 192.168.3.0/24(rw,sync,no_subtree_check,no_root_squash,insecure)
    '';
  };

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
