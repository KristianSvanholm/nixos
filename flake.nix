{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nix-index-database.url = "github:nix-community/nix-index-database";

    nur-packages = {
      url = "github:KristianSvanholm/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #textfox.url = "github:adriankarlen/textfox";
    #nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    username = "krs";
  in {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      mini = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/mini/configuration.nix
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/wsl/configuration.nix
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/server/configuration.nix
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
    };
  };
}
