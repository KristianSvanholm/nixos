{
    description = "Nixos config flake";

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-24.05";
        home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
        home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    outputs = inputs@{ self, ... }:
    let
        userSettings = rec {
            username = "krs";
            name = "KristianRS";
            email = "KristianRorenSvanholm@gmail.com";
        };

        systemSettings = rec {
            hostname = "nixos";
            profile = "default";
            system = "x86_64-linux";
        };

        lib = inputs.nixpkgs-stable.lib;

        pkgs = pkgs-stable;

        pkgs-stable = import inputs.nixpkgs-stable {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };

        home-manager = inputs.home-manager-stable;
    
    in {
        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [(./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")];
                extraSpecialArgs = {
                    inherit pkgs-stable;
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };

        nixosConfigurations = {
            nixos = lib.nixosSystem {
                system = systemSettings.system;
                modules = [(./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")];
                specialArgs = {
                    inherit pkgs-stable;
                    inherit userSettings; 
                    inherit systemSettings;
                    inherit inputs; 
                };
            };
        };
    };
}
