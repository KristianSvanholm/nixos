{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/k3s.nix
  ];

  # Networking setup
  networking = {
    hostName = "srv";
  };

  services = {
    getty.autologinUser = config.user.name;
  };

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "docker" "wheel"];
    };

    defaultUserShell = pkgs.zsh;
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    nmcli
    binutils
    gcc
    ethtool
    gptfdisk
    smartmontools
    nitch
  ];
}
