{ inputs, pkgs, ...}:
{
  xdg.configFile."hypr/wallpaper.jpg".source = ./wallpaper.jpg;

  services.hyprpaper = {
    enable = true; 
    package = inputs.hyprpaper.packages.${pkgs.system}.hyprpaper;
    settings = {
      preload = [
        ".config/hypr/wallpaper.jpg"
      ];
      wallpaper = [
        ",.config/hypr/wallpaper.jpg"
      ];
    };
  };
}
