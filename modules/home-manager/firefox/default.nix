{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-wayland;
  };

  config.stylix.targets.firefox.profileNames = [];
}
