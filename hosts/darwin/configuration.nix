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

  system.defaults.CustomUserPreferences = {
    "NSGlobalDomain" = {
      ApplePressAndHoldEnabled = false;
    };
  };

  imports = [
    inputs.home-manager.darwinModules.default
    inputs.hister.darwinModules.default
    ../config.nix
    ../../modules/darwin/aerospace.nix
    ../../modules/darwin/stylix.nix
    ../../modules/darwin/ssh.nix
  ];

  networking.hostName = "darwin";

  programs.zsh.enableCompletion = false; # handled by home-manager

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

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      ${config.user.name} = import ./home.nix;
    };
  };

  services = {
    tailscale.enable = true;
    hister = {
      enable = true;
    };
  };

  system.primaryUser = config.user.name;
  environment.systemPackages = with pkgs; [
    opencode
  ];

  # Expose nix-darwin paths to GUI apps (e.g. Bruno terminal)
  environment.systemPath = [
    "/run/current-system/sw/bin"
    "${config.user.home}/.nix-profile/bin"
  ];

  system.stateVersion = 6;
}
