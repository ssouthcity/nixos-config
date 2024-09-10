{ pkgs, ... }:

{
  home.packages = [
    pkgs.vesktop
    pkgs.discord-canary
  ];
}
