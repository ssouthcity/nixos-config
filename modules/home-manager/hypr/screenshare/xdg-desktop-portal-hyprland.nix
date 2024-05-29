{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.xdg-desktop-portal-hyprland
  ];
}
