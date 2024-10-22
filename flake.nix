{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
	url = "github:hyprwm/hyprland-plugins";
	inputs.hyprland.follows = "hyprland";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, ... }@inputs:
    {
      nixosConfigurations = {
	default = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs;};
	    modules = [
	      ./hosts/default/configuration.nix
	      inputs.stylix.nixosModules.stylix
	      inputs.home-manager.nixosModules.default
	    ];
	};
	server = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs;};
	    modules = [
	      ./hosts/server/configuration.nix
	      inputs.home-manager.nixosModules.default
	    ];
	};
	laptop = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs;};
	    modules = [
	      ./hosts/laptop/configuration.nix
	      inputs.home-manager.nixosModules.default
	      inputs.stylix.nixosModules.stylix
	    ];
	};
      };
    };
}
