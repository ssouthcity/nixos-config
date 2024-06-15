{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
      };
      background = {
        path = "${config.stylix.image}";
        blur_passes = 3;
        blur_size = 8;
      };
      input-field = {
        size = "360, 64";
        position = "0, 0";
        monitor = "";
        rounding = 16;
        dots_center = true;
        fade_on_empty = false;
        font_family = config.stylix.fonts.sansSerif.name;
        font_color = "rgb(${config.lib.stylix.colors.base05})";
        inner_color = "rgb(${config.lib.stylix.colors.base02})";
        outer_color = "rgb(${config.lib.stylix.colors.base0A})";
        outline_thickness = 2;
        placeholder_text = "Password";
      };
    };
  };
}
