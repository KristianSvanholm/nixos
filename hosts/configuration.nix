{
  pkgs,
  inputs,
  config,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  imports = [
    inputs.home-manager.nixosModules.default
    inputs.nix-index-database.nixosModules.nix-index
    ../modules/nixos/docker.nix
    ../modules/nixos/stylix.nix
    ./hardware-configuration.nix
    ./config.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      ${config.user.name} = import ./home.nix;
    };
  };

  system.stateVersion = "24.11";
}
