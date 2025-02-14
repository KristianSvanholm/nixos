{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nvf.url = "github:notashelf/nvf";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

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

    # Darwin
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { nixpkgs, nix-darwin, nix-homebrew, ... }@inputs:
  let 
    username = "krs";
    home = "/home/krs";
    home_d = /users/krs ;
  in
    {
      nixosConfigurations = {
	default = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs username home;};
	    modules = [
	      ./hosts/default/configuration.nix
	      inputs.stylix.nixosModules.stylix
	      inputs.home-manager.nixosModules.default
	      inputs.nvf.nixosModules.default
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
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
	specialArgs = {inherit inputs username home_d;};
	modules = [
	    ./hosts/mac/configuration.nix
	    inputs.home-manager.darwinModules.default
	    inputs.nvf.nixosModules.default
            nix-homebrew.darwinModules.nix-homebrew
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
