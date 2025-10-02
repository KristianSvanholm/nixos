{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/adguard.nix
    ../../modules/nixos/homelab/intel.nix
    ../../modules/nixos/homelab/k3s.nix
  ];

  # Networking setup
  networking = {
    hostName = "HomeLab";
    firewall.enable = true;
  };

  services = {
    getty.autologinUser = config.user.name;
    logind.lidSwitchExternalPower = "ignore";
  };

  # For laptop hosts
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "docker" "wheel"];
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
