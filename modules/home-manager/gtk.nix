{ pkgs, ... }:
{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      cursor.enable = true;
      icon.enable = true;
      tweaks = [ "normal" "rimless" ];
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
