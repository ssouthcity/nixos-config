{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware?ref=master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      treefmt-nix,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        outputs = self.outputs;
      in
      {
        formatter.${system} = treefmt-nix.lib.mkWrapper pkgs {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        };

        nixosConfigurations.neptr = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/neptr ];
        };

        nixosConfigurations.nb-wsl = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/nb-wsl ];
        };

        homeConfigurations."southcity@neptr" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./users/southcity/personal.nix ];
        };

        homeConfigurations."southcity@nb-wsl" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./users/southcity/work.nix ];
        };
      }
    );
}
