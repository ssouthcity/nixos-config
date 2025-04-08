{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix

    ./features/appearance
    ./features/apps
    ./features/cli
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        "spotify"
      ];

    # Not handled by stylix
    gtk.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
  };
}
