{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix

    outputs.homeManagerModules.apps
    outputs.homeManagerModules.cli
    outputs.homeManagerModules.nixvim
    outputs.homeManagerModules.stylix
    outputs.homeManagerModules.tmux
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

    home.packages = [
      pkgs.discord
      pkgs.spotify
    ];

    # Not handled by stylix
    gtk.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    programs.git = {
      userName = "Stian Sørby";
      userEmail = "51554341+ssouthcity@users.noreply.github.com";
    };
  };
}
