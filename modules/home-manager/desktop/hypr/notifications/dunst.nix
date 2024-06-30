{ config, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = config.gtk.iconTheme.name;
      package = config.gtk.iconTheme.package;
    };
    settings = {
      global = {
        corner_radius = 8;
      };
    };
  };
}
