{ pkgs, ... }:

{
  imports = [
    ../../bundles/home-manager/cli
    ../../bundles/home-manager/entertainment
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

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
