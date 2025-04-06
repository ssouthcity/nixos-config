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
        outputs = self.outputs;
      in
      {
        formatter.${system} = pkgs.nixfmt-rfc-style;

        nixosModules.default = import ./nixosModules/default.nix { inherit inputs pkgs; };
        nixosModules.peripherals = import ./nixosModules/peripherals.nix { inherit inputs pkgs; };

        homeManagerModules.cli = import ./homeManagerModules/cli.nix { inherit inputs pkgs; };
        homeManagerModules.apps = import ./homeManagerModules/apps.nix { inherit inputs pkgs; };
        homeManagerModules.nixvim = import ./homeManagerModules/nixvim { inherit inputs pkgs; };
        homeManagerModules.stylix = import ./homeManagerModules/stylix { inherit inputs pkgs; };
        homeManagerModules.tmux = import ./homeManagerModules/tmux { inherit inputs pkgs; };

        nixosConfigurations.neptr = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit inputs outputs; };
          modules = [./hosts/neptr];
        };
        
        nixosConfigurations.nb-wsl = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit inputs outputs; };
          modules = [./hosts/nb-wsl];
        };

        homeConfigurations."southcity@neptr" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [./users/southcity/personal.nix];
        };
        
        homeConfigurations."southcity@nb-wsl" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [./users/southcity/work.nix];
        };
      }
    );
}
