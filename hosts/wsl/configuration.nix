{
  config,
  lib,
  inputs,
  username,
  home,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = username;

  programs = {
    zsh.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username home;};
    users = {
      ${username} = import ./home.nix;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    binutils
    gcc
    maven
    zulu17
    nodejs
  ];

  system.stateVersion = "24.11";
}
