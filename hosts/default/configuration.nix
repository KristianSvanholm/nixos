# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, callPackage, inputs, ... }:

{

    # Activate flakes
    nix.settings.experimental-features = [ "nix-command" "flakes"];

    imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	../../modules/nixos/boot.nix
	../../modules/nixos/stylix.nix
	../../modules/nixos/bluetooth.nix
	../../modules/nixos/nvidia.nix
	../../modules/nixos/audio.nix
	../../modules/nixos/i3.nix
	../../modules/nixos/steam.nix
	../../modules/nixos/thunar.nix
	../../modules/nixos/virtualbox.nix
    ];

    networking.hostName = "nixos"; # Define your hostname.
    networking.firewall.enable = true;
    networking.enableIPv6 = true;

    # Enable networking
    networking.networkmanager.enable = true;

    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Set your time zone.
    time.timeZone = "Europe/Oslo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    # Configure keymap in X11
    services.xserver.xkb = {
	layout = "no";
	variant = "";
    };

    # vpn
    services.mullvad-vpn.enable = true;

    # Configure console keymap
    console.keyMap = "no";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.krs = {
	isNormalUser = true;
	extraGroups = [ "networkmanager" "wheel" ];
    };

    home-manager = {
  	useGlobalPkgs = true;
	extraSpecialArgs= { inherit inputs; };
	users = {
	    "krs" = import ./home.nix;
	};
    };

    # Install firefox.
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. 
    environment.systemPackages = with pkgs; [
	git
	htop
	nvtopPackages.full
	neofetch
	go
	binutils
	home-manager
	gcc
	ripgrep
	fd
	loupe
	mullvad-vpn
	libreoffice
	teams-for-linux
    ];
  
    fileSystems."/jellyfin" = {
	device = "192.168.3.112:/jellyfin";
	fsType = "nfs";
	options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "user"];
    };
 
    system.stateVersion = "24.05"; # Don't touch
}
