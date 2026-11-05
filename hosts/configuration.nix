{
  pkgs,
  inputs,
  config,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  imports = [
    inputs.home-manager.nixosModules.default
    ../modules/nixos/sudo-rs.nix
    ../modules/nixos/stylix.nix
    ./config.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
    users = {
      ${config.user.name} = import ./home.nix;
    };
  };

  system.stateVersion = "24.11";
}
