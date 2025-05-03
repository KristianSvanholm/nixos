{...}: {
  # NFS SERVER
  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';
    exports = ''
      /jellyfin	 	192.168.2.2(rw,fsid=0,no_subtree_check)
      /jellyfin/movies 	192.168.2.2(rw,nohide,insecure,no_subtree_check)
      /jellyfin/tv-shows	192.168.2.2(rw,nohide,insecure,no_subtree_check)
    '';
  };
}
