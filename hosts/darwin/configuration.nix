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
    ../../modules/darwin/aerospace.nix
    ../../modules/darwin/stylix.nix
    ../../modules/darwin/ssh.nix
  ];

  networking.hostName = "darwin";

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      ${config.user.name} = import ./home.nix;
    };
  };

  services.tailscale = {
    enable = true;
  };

  system.primaryUser = config.user.name;
  environment.systemPackages = with pkgs; [
    opencode
    crush
  ];

  system.stateVersion = 6;
}
