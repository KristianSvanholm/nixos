{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix

    ../../modules/nixos/systemd-boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/intel.nix
    ../../modules/nixos/homelab/longhorn.nix
    ../../modules/nixos/homelab/service-users.nix
    ../../modules/nixos/homelab/comin.nix
    ../../modules/nixos/jotta.nix
  ];

  # Lets wheel push closures with `nixos-rebuild --target-host`. Effectively
  # root-equivalent, so only meaningful because wheel is just you.
  nix.settings.trusted-users = ["@wheel"];

  # Networking setup
  networking = {
    firewall.enable = true;
    nameservers = ["1.1.1.1" "8.8.8.8"];
    # else DHCP appends AdGuard and CoreDNS forwards back into the cluster
    dhcpcd.extraConfig = "nohook resolv.conf";
  };

  # For laptop hosts
  systemd.sleep.settings.Sleep = {
    AllowSuspend = false;
    AllowHibernation = false;
    AllowHybridSleep = false;
    AllowSuspendThenHibernate = false;
  };

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      uid = 1000; # the nfs backups export squashes to this
      extraGroups = ["networkmanager" "docker" "wheel"];
    };

    defaultUserShell = pkgs.zsh;
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    ethtool
    gptfdisk
    smartmontools
    ghostty.terminfo
  ];
}
