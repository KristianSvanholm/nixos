{ pkgs, inputs, username, home, ... }:
{

    # Activate flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	../../modules/nixos/boot.nix
	../../modules/nixos/localization.nix
	../../modules/nixos/server/ssh.nix
	../../modules/nixos/server/intel.nix
	../../modules/nixos/server/nginx.nix
	../../modules/nixos/server/yarr.nix
	../../modules/nixos/server/adguard.nix
	../../modules/nixos/server/immich.nix
        #../../modules/nixos/server/home-assistant.nix
        #../../modules/nixos/server/proxmox.nix
        ../../modules/nixos/server/uptime-kuma.nix
        ../../modules/nixos/server/microbin.nix
	#../../modules/nixos/server/minecraft/minecraft.nix
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
                #111 2049 4000 4001 4002 20048 # NFS
		6969 # Qbittorrent-nox
		25565 # Minecraft
	    ];
	    allowedUDPPorts = [ 
                #111 2049 4000 4001 4002 20048 # NFS
		19132 24454 # Minecraft (default + proxchat)
	    ];
	};
    };

    programs = {
	zsh.enable = true;
    };

    services = {
	getty.autologinUser = username;
	mullvad-vpn.enable = true;
    };
  
    users = {
	users.${username} = {
	    isNormalUser = true;
	    extraGroups = [ "networkmanager" "docker" "wheel" ];
	};

	defaultUserShell = pkgs.zsh;
    };

    home-manager = {
	useGlobalPkgs = true;
	extraSpecialArgs = { inherit inputs username home; };
	users = { 
	    ${username} = import ./home.nix;
	};
    };

    virtualisation.docker = {
	enable = true;
    };

    nixpkgs.config.allowUnfree = true;

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
    ];

    system.stateVersion = "24.05"; # Did you read the comment?

}

