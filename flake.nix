{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware?ref=master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    dotfiles = {
      url = "github:ssouthcity/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      outputs = self.outputs;
    in
    {
      nixosConfigurations = {
        amo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
	        modules = [ ./hosts/amo/configuration.nix ];
        };
      };
    };
}
