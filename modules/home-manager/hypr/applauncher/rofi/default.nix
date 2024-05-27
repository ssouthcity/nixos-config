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
      modes = "window,drun,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      show-icons = true;
      display-drun = "";
      display-filebrowser = "";
      display-window = "";
      display-power-menu = "⏻";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };
  };
}
