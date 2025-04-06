{ pkgs, lib, ... }:

{
  imports = [
    ../../bundles/home-manager/cli
    ../../bundles/home-manager/entertainment
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "discord-canary"
      "spotify"
      "terraform"
    ];

    nixpkgs.overlays = [
      (final: prev: {
        terraform = pkgs.mkTerraform {
          version = "1.10.5";
          hash = "sha256-6Y9r3VxL3DRvUaU6hLE+SdqjfIF+PAlXEYBPBc571QE=";
          vendorHash = "sha256-xyFguSjqUweZyoO97nkjLfJWS+eifNV7hpJUjh/6Z54=";
        };
      })
    ];

    home.packages = [pkgs.terraform];

    # Not handled by stylix
    gtk.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    modules.git = {
      enable = true;
      userName = "Stian Sørby";
      userEmail = "51554341+ssouthcity@users.noreply.github.com";
    };
  };
}
