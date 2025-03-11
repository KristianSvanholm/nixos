{ pkgs, inputs, username, home_d, ...}:
{
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.hostPlatform = "aarch64-darwin";

    nixpkgs.config.allowUnfree = true;

    nix.enable = false; # Only because of determinate systems installer

    imports = [
        ../../modules/darwin/spotlight.nix
        ../../modules/darwin/settings.nix
        ../../modules/darwin/yabai.nix
        ../../modules/darwin/skhd.nix
        ../../modules/nixos/r.nix
    ];

    homebrew = {
        enable = true;
        casks = [];
        brews = [];
        onActivation.cleanup = "zap";
    };

    networking.hostName = "mac";

    users.users.${username}.home = home_d;

    home-manager = {
        useGlobalPkgs = true;
        extraSpecialArgs = {inherit inputs username home_d;};
        users = {
            ${username} = import ./home.nix;
        };
    };

    fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.dejavu_fonts
    ];

    programs = {
        zsh.enable = true;
    };

    system.stateVersion = 6;
}
