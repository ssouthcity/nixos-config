{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  pinnedPackageVersionsOverlay = final: prev: {
    terraform = pkgs.mkTerraform {
      version = "1.11.0";
      hash = "sha256-CPt1SxZZEvK2MXk45vvtKb2/NR/4yNWXBEUm6dvBXkU=";
      vendorHash = "sha256-xF9m67GE3MgeKqy7DGAf8RO1/MCZ5Uis1XNrajogQcI=";
    };
  };
in
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix

    ./features/appearance
    ./features/cli
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "terraform"
      ];

    nixpkgs.overlays = [
      pinnedPackageVersionsOverlay
    ];

    programs.git = {
      userName = lib.mkForce "Stian Sørby";
      userEmail = lib.mkForce "stian.sorby@norges-bank.no";
      credential = {
        helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        useHttpPath = true;
      };
    };

    home.packages = [
      pkgs.azure-cli
      pkgs.terraform
    ];
  };
}
