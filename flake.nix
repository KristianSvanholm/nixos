{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf/v0.8";
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
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      mini = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/mini/configuration.nix];
      };
      homelab = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/homelab/configuration.nix];
      };
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [./hosts/wsl/configuration.nix];
      };
    };
  };
}
