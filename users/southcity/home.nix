{ pkgs, ... }:

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

    modules.git = {
      enable = true;
      userName = "Stian Sørby";
      userEmail = "51554341+ssouthcity@users.noreply.github.com";
    };
  };
}
