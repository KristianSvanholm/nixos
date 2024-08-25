# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{

  # Activate flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/boot.nix
      ../../modules/nixos/ssh.nix
    ];
	
  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time zone and locale.
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.srv = {
	isNormalUser = true;
	description = "srv";
	extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
	useGlobalPkgs = true;
	extraSpecialArgs = { inherit inputs; };
	users = { 
		"srv" = import ./home.nix;
	};
  };

  services.getty.autologinUser = "srv";
  services.jellyfin.enable = true;  
  services.mullvad-vpn.enable = true;
  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   	vim 
   	wget
	plex
	tmux
	jellyfin
	jellyfin-web
	jellyfin-ffmpeg
	qbittorrent-nox
	mullvad
	cockroachdb-bin
	go
	nodejs
  ];

  systemd = {
    packages = [pkgs.qbittorrent-nox];
    services."qbittorrent-nox@srv" = {
      overrideStrategy = "asDropin";
      wantedBy = ["multi-user.target"];
    };
  };

  # NFS SERVER
  services.nfs.server = {
	enable = true;
	lockdPort = 4001;
	mountdPort = 4002;
	statdPort = 4000;
	extraNfsdConfig = '''';
	exports =''
		/jellyfin	 	192.168.2.2(rw,fsid=0,no_subtree_check)
		/jellyfin/movies 	192.168.2.2(rw,nohide,insecure,no_subtree_check)
		/jellyfin/tv-shows	192.168.2.2(rw,nohide,insecure,no_subtree_check)
  	'';

  };

  # Open ports in the firewall.
  # ssh: 22, jellyfin: 8096, nfs: 2049
  networking.firewall = {
	enable = true;
	allowedTCPPorts = [ 22 8096 111 2049 4000 4001 4002 20048 6969 9595];
	allowedUDPPorts = [ 111 2049 4000 4001 4002 20048 6969 9595];
  };

 system.stateVersion = "24.05"; # Did you read the comment?

}

