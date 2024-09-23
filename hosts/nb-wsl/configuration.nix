{ pkgs, inputs, ... }:

{
  imports = [
    ../../bundles/nixos/common
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "southcity";

  networking.hostName = "nb-wsl";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "23.11";
}
