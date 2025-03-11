# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, username, home, ... }:

{

    # Activate flakes
    nix.settings.experimental-features = [ "nix-command" "flakes"];

    imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	../../modules/nixos/boot.nix
	../../modules/nixos/localization.nix
	../../modules/nixos/stylix.nix
	../../modules/nixos/bluetooth.nix
	../../modules/nixos/audio.nix
	../../modules/nixos/hyprland.nix
	../../modules/nixos/thunar.nix
	../../modules/nixos/ly.nix
	../../modules/nixos/1pass.nix
        ../../modules/nixos/r.nix
    ];

    networking = {
	hostName = "nixos";
	firewall.enable = true;
	enableIPv6 = true;
	networkmanager.enable = true;
    };

    programs = {
	firefox.enable = false;
	zsh.enable = true;
    };
    
    services = {
	mullvad-vpn.enable = true;
	printing.enable = true;
    };

    users = {
	users.${username} = {
	    isNormalUser = true;
	    extraGroups = [ "networkmanager" "wheel" "libvirtd"];
	};

	defaultUserShell = pkgs.zsh;
    };

    home-manager = {
  	useGlobalPkgs = true;
	extraSpecialArgs= { inherit inputs username home; };
	users = {
	    ${username} = import ./home.nix;
	};
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. 
    environment.systemPackages = with pkgs; [
	nvtopPackages.full
	go
	binutils
	gcc
	zulu17
	maven
	nix-prefetch-github
    ];
  
    system.stateVersion = "24.05"; # Don't touch
}
