{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix 
  ];

  config = {
    stylix.enable = true;

    stylix.image = ./wallpaper2.png;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

    stylix.polarity = "dark";

    stylix.cursor = {
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
      package = pkgs.capitaine-cursors-themed;
    };

    stylix.fonts = {
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };

      monospace = {
        name = "MesloLGS Nerd Font Mono";
        package = pkgs.nerdfonts.override { fonts = ["Meslo"]; };
      };

      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };

      sizes = {
        desktop = 12;
      };
    };
  };
}
