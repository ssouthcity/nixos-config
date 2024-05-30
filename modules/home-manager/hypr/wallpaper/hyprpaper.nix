{ inputs, pkgs, ...}:
{
  xdg.configFile."hypr/wallpaper.png".source = ./wallpaper2.png;

  services.hyprpaper = {
    enable = true; 
    package = inputs.hyprpaper.packages.${pkgs.system}.hyprpaper;
    settings = {
      preload = [
        ".config/hypr/wallpaper.png"
      ];
      wallpaper = [
        ",.config/hypr/wallpaper.png"
      ];
    };
  };
}
