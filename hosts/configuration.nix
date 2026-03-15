{
  pkgs,
  inputs,
  config,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.nix-index-database.comma.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    direnvrcExtra = ''
      echo "loaded direnv!"
    '';
    settings.log_format = "-";
    settings.log_filter = "^$";
  };
  users.defaultUserShell = pkgs.zsh;

  imports = [
    inputs.home-manager.nixosModules.default
    inputs.nix-index-database.nixosModules.nix-index
    ../modules/nixos/docker.nix
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
