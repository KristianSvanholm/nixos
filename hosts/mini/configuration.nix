# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/limine.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/sysc-greet.nix
    ../../modules/nixos/1pass.nix
    ../../modules/nixos/zsa.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/tailscale.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/jotta.nix
    ../../modules/nixos/virt.nix
    ../../modules/nixos/work.nix
    ../../modules/nixos/flatpak.nix
  ];

  networking = {
    hostName = "nixos";
    nameservers = ["192.168.3.112"];

    firewall.enable = true;
    enableIPv6 = true;
    networkmanager.enable = true;
  };

  services = {
    printing.enable = true;
  };

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "docker" "libvirtd"];
    };
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];
}
