{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware?ref=master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      outputs = self.outputs;
    in
    {
      nixosConfigurations = {
        amo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [ ./hosts/amo/configuration.nix ];
        };
        neptr = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          modules = [
            ./hosts/neptr/configuration.nix
            ./hosts/neptr/hardware-configuration.nix
          ];
        };
        nb-wsl = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {inherit inputs outputs pkgs;};
          modules = [ ./hosts/nb-wsl/configuration.nix ];
        };
      };

      homeConfigurations = {
        "southcity@neptr" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            inputs.nixvim.homeManagerModules.default
            inputs.stylix.homeManagerModules.stylix 
            ./users/personal
          ];
        };
        "southcity@amo" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            inputs.nixvim.homeManagerModules.default
            inputs.stylix.homeManagerModules.stylix 
            ./users/dev
          ];
        };
        "southcity@nb-wsl" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            inputs.nixvim.homeManagerModules.default
            inputs.stylix.homeManagerModules.stylix 
            ./users/work
          ];
        };
      };
    };
}
