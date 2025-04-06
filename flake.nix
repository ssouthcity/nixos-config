{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware?ref=master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter.${system} = pkgs.nixfmt-rfc-style;

        nixosModules.default = import ./nixosModules/default.nix { inherit inputs; };
        nixosModules.peripherals = import ./nixosModules/peripherals.nix { inherit inputs; };

        nixosConfigurations.neptr = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          modules = [
            self.nixosModules.default
            self.nixosModules.peripherals
            ./hosts/neptr
          ];
        };
        
        nixosConfigurations.nb-wsl = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs pkgs; };
          modules = [
            inputs.nixos-wsl.nixosModules.default
            self.nixosModules.default
            ./hosts/nb-wsl
          ];
        };

        homeConfigurations."southcity@neptr" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.nixvim.homeManagerModules.default
            inputs.stylix.homeManagerModules.stylix
            ./users/personal
          ];
        };
        
        homeConfigurations."southcity@nb-wsl" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.nixvim.homeManagerModules.default
            inputs.stylix.homeManagerModules.stylix
            ./users/work
          ];
        };
      }
    );
}
