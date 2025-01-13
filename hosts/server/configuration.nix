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
	../../modules/nixos/server/jellyfin.nix
	../../modules/nixos/server/plex.nix
	../../modules/nixos/server/yarr.nix
	../../modules/nixos/server/qbittorrent-nox.nix
	#../../modules/nixos/server/nfs.nix
	../../modules/nixos/server/minecraft/minecraft.nix
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

    virtualisation.docker.rootless = {
	enable = true;
	setSocketVariable = true;
    };

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
	ethtool
    ];

    system.stateVersion = "24.05"; # Did you read the comment?

}

