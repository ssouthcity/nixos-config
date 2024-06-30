{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "southcity";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "neptr-wsl";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      southcity = import ../../users/southcity-clionly/home.nix;
    };
  };

  system.stateVersion = "23.11";
}
