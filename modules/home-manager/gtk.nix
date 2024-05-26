{ pkgs, ... }:
{
  gtk = {
    enable = true;
    # catppuccin = {
    #   enable = true;
    #   cursor.enable = true;
    #   icon.enable = true;
    #   tweaks = [ "normal" "rimless" ];
    # };
    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
