# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/localization.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/ly.nix
    ../../modules/nixos/1pass.nix
    ../../modules/nixos/r.nix
    ../../modules/nixos/spicetify.nix
  ];

  networking = {
    hostName = "nixos";
    nameservers = ["192.168.3.112"];
    firewall.enable = true;
    enableIPv6 = true;
    networkmanager.enable = true;
  };

  services = {
    mullvad-vpn.enable = true;
    printing.enable = true;
  };

  users = {
    users.${config.user.name} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
    };

    defaultUserShell = pkgs.zsh;
  };

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
    go
    binutils
    gcc
    zulu17
    maven
    nix-prefetch-github
    #inputs.nur-packages.packages.${pkgs.hostPlatform.system}.zz
    #inputs.nur-packages.packages.${pkgs.hostPlatform.system}.p2ptui
  ];
}
