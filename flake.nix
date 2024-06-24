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
        neptr-wsl = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {inherit inputs outputs pkgs;};
          modules = [ ./hosts/neptr-wsl/configuration.nix ];
        };
      };
    };
}
