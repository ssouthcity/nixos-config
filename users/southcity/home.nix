{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.hyprland.homeManagerModules.default
    ../../modules/home-manager/catppuccin.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/discord.nix
    ../../modules/home-manager/fzf.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/gtk.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/nvim.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/xdg.nix
    ../../modules/home-manager/zotero.nix
    ../../modules/home-manager/zsh.nix
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    xdg.enable = true;

    home.file."pictures/background-image".source = ./wallpaper.jpg;

    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    nixpkgs.config.allowUnfree = true;

    programs.home-manager.enable = true;
  };
}
