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
      ../../modules/nixos/bluetooth.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/audio.nix
      ../../modules/nixos/i3.nix
      ../../modules/nixos/steam.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

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
    description = "krs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager = {
	specialArgs= { inherit inputs; };
	users = {
	  "krs" = import ./home.nix;
	};
  }:

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
    mullvad-vpn
  ];

  programs.neovim = {
	enable = true;
	defaultEditor = true;
	withNodeJs = true;
	withPython3 = true;
  };

  fileSystems."/jellyfin" = {
    device = "192.168.3.112:/jellyfin";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "user"];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
