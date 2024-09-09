{ pkgs, ... }:
{
  imports = [
    ../../bundles/home-manager/cli
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

    modules.git = {
      enable = true;
      userName = "Stian Sørby";
      userEmail = "stian.sorby@norges-bank.no";
      useHttpPath = true;
      wslCredentialHelper.enable = true;
    };

    home.packages = with pkgs; [ azure-cli terraform ];

    programs.home-manager.enable = true;
  };
}
