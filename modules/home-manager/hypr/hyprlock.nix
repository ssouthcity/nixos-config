{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
      };
      background = {
        path = "~/.config/hypr/wallpaper.png";
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
        font_color = "rgb(fbf1c7)";
        inner_color = "rgb(282828)";
        outer_color = "rgb(fbf1c7)";
        outline_thickness = 2;
        placeholder_text = "Password";
      };
    };
  };
}
