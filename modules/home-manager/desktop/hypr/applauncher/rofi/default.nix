{ pkgs, ... }:
{
  xdg.configFile."rofi/background.png".source = ./background.png;

  # stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = {};

    plugins = [
      pkgs.rofi-power-menu
    ];

    extraConfig = {
      modes = "window,drun,filebrowser,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      show-icons = true;
      normal-window = true;
      drun-display-format = "{name}";
      # drun = {
      #   display-name = "";
      # };
      # filebrowser = {
      #   display-name = "";
      # };
      # window = {
      #   display-name = "";
      #   format = "{w} · {c} · {t}";
      # };
      # power-menu = {
      #   display-name = "⏻";
      # };
    };
  };
}
