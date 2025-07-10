{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    # NVF with #566 MWN patch
    nvf.url = "github:notashelf/nvf";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nur-packages = {
      url = "github:KristianSvanholm/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # Darwin
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    nix-homebrew,
    ...
  } @ inputs: let
    username = "krs";
    home = "/home/krs";
    home_d = /users/krs;
  in {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username home;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.default
          inputs.spicetify-nix.nixosModules.spicetify
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      mini = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username home;};
        modules = [
          ./hosts/mini/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.default
          inputs.spicetify-nix.nixosModules.spicetify
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username home;};
        modules = [
          ./hosts/wsl/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username home;};
        modules = [
          ./hosts/server/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.proxmox-nixos.nixosModules.proxmox-ve
          inputs.home-manager.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
        ];
      };
    };
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs username home_d;};
      modules = [
        ./hosts/mac/configuration.nix
        inputs.home-manager.darwinModules.default
        inputs.nvf.nixosModules.default
        nix-homebrew.darwinModules.nix-homebrew
        inputs.spicetify-nix.darwinModules.spicetify
        inputs.nix-index-database.darwinModules.nix-index
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = username;
            autoMigrate = true;
          };
        }
      ];
    };
  };
}
