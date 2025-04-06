{ pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "southcity";

  networking.hostName = "nb-wsl";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "23.11";
}
