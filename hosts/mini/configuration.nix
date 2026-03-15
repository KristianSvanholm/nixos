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
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/ly.nix
    ../../modules/nixos/1pass.nix
    ../../modules/nixos/zsa.nix
    ../../modules/nixos/r.nix
    ../../modules/nixos/spicetify.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/tailscale.nix
  ];

  networking = {
    hostName = "nixos";

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
      extraGroups = ["networkmanager" "wheel"];
    };
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
    binutils
    gcc
    maven
    nix-prefetch-github
    virt-viewer
    zulu11
    #inputs.nur-packages.packages.${pkgs.hostPlatform.system}.zz
    #inputs.nur-packages.packages.${pkgs.hostPlatform.system}.p2ptui
  ];
}
