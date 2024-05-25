{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:ssouthcity/nixos-hardware/lenovo-legion-15ach6h";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprpaper.url = "git+https://github.com/hyprwm/hyprpaper?submodules=1";

    catppuccin.url = "github:catppuccin/nix";

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
	        modules = [ 
            inputs.nixos-hardware.nixosModules.lenovo-legion-15ach6h
            ./hosts/amo/configuration.nix 
          ];
        };
      };
    };
}
