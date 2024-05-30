{ pkgs, ... }:
{
  xdg.configFile."rofi/background.png".source = ./background.png;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./theme.rasi;

    plugins = [
      pkgs.rofi-power-menu
    ];

    extraConfig = {
      modes = "window,drun,filebrowser,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
    };
  };
}
