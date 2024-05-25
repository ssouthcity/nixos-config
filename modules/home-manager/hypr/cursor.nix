{ pkgs, ... }:
{
  home.pointerCursor = {
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaFlamingo;
    name = "Catppuccin-Mocha-Flamingo-Cursors";
  };
}
