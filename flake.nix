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

  outputs = { nixpkgs, ... }@inputs:
  let 
    username = "krs";
    home = "/home/krs";
  in
    {
      nixosConfigurations = {
	default = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs username home;};
	    modules = [
	      ./hosts/default/configuration.nix
	      inputs.stylix.nixosModules.stylix
	      inputs.home-manager.nixosModules.default
	    ];
	};
	server = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs username home;};
	    modules = [
	      ./hosts/server/configuration.nix
	      inputs.stylix.nixosModules.stylix
	      inputs.home-manager.nixosModules.default
	    ];
	};
      };
    };
}
