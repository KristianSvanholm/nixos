{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/intel.nix
    ../../modules/nixos/homelab/nginx.nix
    ../../modules/nixos/homelab/yarr.nix
    ../../modules/nixos/homelab/adguard.nix
    ../../modules/nixos/homelab/immich.nix
    ../../modules/nixos/homelab/uptime-kuma.nix
    ../../modules/nixos/homelab/microbin.nix
    ../../modules/nixos/homelab/paperless.nix
  ];

  # Networking setup
  networking = {
    hostName = "srv";
    networkmanager.enable = true;

    # Remember to update interface name for new devices
    interfaces.eno1.wakeOnLan.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        9090 # Overleaf
        #111 2049 4000 4001 4002 20048 # NFS
        6969 # Qbittorrent-nox
        25565 # Minecraft
      ];
      allowedUDPPorts = [
        #111 2049 4000 4001 4002 20048 # NFS
        19132
        24454 # Minecraft (default + proxchat)
      ];
    };
  };

  services = {
    getty.autologinUser = config.user.name;
    mullvad-vpn.enable = true;
  };

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "docker" "wheel"];
    };

    defaultUserShell = pkgs.zsh;
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker
    binutils
    gcc
    docker-compose
    mullvad
    ethtool
    gptfdisk
    smartmontools
    nitch
    texliveFull
    inkscape
  ];
}
