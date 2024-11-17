{ config, lib, pkgs, inputs, ... }:
{

    # Activate flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	../../modules/nixos/boot.nix
	../../modules/nixos/server/ssh.nix
	../../modules/nixos/server/jellyfin.nix
	../../modules/nixos/server/qbittorrent-nox.nix
	../../modules/nixos/server/nfs.nix
	../../modules/nixos/server/minecraft/minecraft.nix
    ];
	
    # Networking setup
    networking = {
	hostname = "nixos";
	networkmanager.enable = true;
	eno1.wakeOnLan.enable = true;
    };

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # Time zone and locale.
    time.timeZone = "Europe/Oslo";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.srv = {
	isNormalUser = true;
	description = "srv";
	extraGroups = [ "networkmanager" "docker" "wheel" ];
    };

    home-manager = {
	useGlobalPkgs = true;
	extraSpecialArgs = { inherit inputs; };
	users = { 
	    "srv" = import ./home.nix;
	};
    };

    services.getty.autologinUser = "srv";
    services.mullvad-vpn.enable = true;
  
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
	vim 
   	wget
	tmux
	docker
	binutils
	gcc
	docker-compose
	mullvad
	ripgrep
    ];

    virtualisation.docker.rootless = {
	enable = true;
	setSocketVariable = true;
    };

    # Open ports in the firewall.
    networking.firewall = {
	enable = true;
	allowedTCPPorts = [
	    22 # SSH
	    8096 # Jellyfin 
	    111 2049 4000 4001 4002 20048 # NFS
	    6969 # Qbittorrent-nox
	    25565 # Minecraft
	];
	allowedUDPPorts = [ 
	    111 2049 4000 4001 4002 20048 # NFS
	    6969 # Qbittorrent-nox
	    19132 24454 # Minecraft (default + proxchat)
	];
    };

    system.stateVersion = "24.05"; # Did you read the comment?

}

