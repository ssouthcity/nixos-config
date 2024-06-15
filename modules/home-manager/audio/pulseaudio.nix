{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    pamixer
  ];
}
