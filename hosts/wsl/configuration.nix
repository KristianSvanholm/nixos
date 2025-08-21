{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../modules/nixos/stylix.nix
    ../configuration.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = config.user.name;

  home-manager.users.${config.user.name} = import ./home.nix;

  virtualisation.docker = {
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    binutils
    gcc
    maven
    jdk17
    nodejs
  ];
}
