{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../configuration.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = config.user.name;

  home-manager.users.${config.user.name} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    binutils
    gcc
    maven
    jdk17
    nodejs
  ];
}
