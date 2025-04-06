{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
  };

  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 8;
    };
  };
}
