{
  pkgs,
  config,
  inputs,
  ...
}: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  user.home = "/Users/krs";
  users = {
    users.${config.user.name} = {
      home = "/Users/${config.user.name}";
    };
  };

  imports = [
    inputs.home-manager.darwinModules.default
    ../config.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      ${config.user.name} = import ./home.nix;
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.dejavu_fonts
  ];

  environment.systemPackages = with pkgs; [];

  system.stateVersion = 6;
}
