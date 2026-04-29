{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/systemd-boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/intel.nix
    ../../modules/nixos/homelab/k3s.nix
    ../../modules/nixos/homelab/incus.nix
    ../../modules/nixos/jotta-cli.nix
  ];

  # Networking setup
  networking = {
    hostName = "HomeLab";
    firewall.enable = true;
  };

  services = {
    getty.autologinUser = config.user.name;
    logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
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
      extraGroups = ["networkmanager" "docker" "wheel" "incus-admin"];
    };

    defaultUserShell = pkgs.zsh;
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    binutils
    gcc
    ethtool
    gptfdisk
    smartmontools
    nitch
  ];
}
