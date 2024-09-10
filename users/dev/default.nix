{
  imports = [
    ../../bundles/home-manager/cli
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    modules.git = {
      enable = true;
      userName = "Stian Sørby";
      userEmail = "51554341+ssouthcity@users.noreply.github.com";
      wslCredentialHelper.enable = true;
    };
  };
}
