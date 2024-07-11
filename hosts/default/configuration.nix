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
      ../../modules/nixos/boot.nix
      ../../modules/nixos/bluetooth.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/audio.nix
      ../../modules/nixos/i3.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment.pathsToLink = [ "/libexec" ]; # Links /libexec from derivations to /run/current-system/sw
   
  services.autorandr = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krs = {
    isNormalUser = true;
    description = "krs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  home-manager = {
        extraSpecialArgs = { inherit inputs; };
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
	wget
	htop
	nvtopPackages.full
	neofetch
	go
    libgcc
    discord
    steam
    modrinth-app
  ];

  programs.neovim = {
	enable = true;
	defaultEditor = true;
	withNodeJs = true;
	withPython3 = true;
	#extraPackages = [pkgs.ripgrep pkgs.go];
  };

  programs.steam = {
	enable = true;
	remotePlay.openFirewall = true; # Open ports in fw for steam remote play
	dedicatedServer.openFirewall = true; # Open ports in fw for Source dedicated server
	localNetworkGameTransfers.openFirewall = true; # Open ports in fw for steam local network game transfers
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
