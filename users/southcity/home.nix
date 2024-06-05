{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    nixpkgs.config.allowUnfree = true;

    programs.home-manager.enable = true;

    # Not handled by stylix
    gtk.iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
  };
}
