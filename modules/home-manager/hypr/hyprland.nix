{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    catppuccin.enable = true;

    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";
      env = [
        "NIXOS_OZONE_WSL,1"
        "XDG_SESSION_TYPE,wayland"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
      decoration = {
        rounding = 6;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          vibrancy = 0.1696;
          xray = true;
        };
        dim_inactive = true;
        dim_strength = 0.2;
      };
      input = {
        kb_layout = "no";
        kb_variant = "nodeadkeys";

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
      }; 
      bind = [
        "SUPER, B, exec, firefox"
        "SUPER, Q, exec, kitty"
        "SUPER, space, exec, rofi -show drun -normal-window"
        "SUPER, F, fullscreen"
        "SUPER, V, togglefloating"
        "SUPER, D, killactive"

        "SUPER, 1, movefocus, 1"
        "SUPER, 2, movefocus, 2"
        "SUPER, 3, movefocus, 3"
        "SUPER, 4, movefocus, 4"

        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, j, movefocus, d"
        "SUPER, k, movefocus, u"

        "SUPER_SHIFT, h, movewindow, l"
        "SUPER_SHIFT, l, movewindow, r"
        "SUPER_SHIFT, j, movewindow, d"
        "SUPER_SHIFT, k, movewindow, u"
      ];
    };
  };
}
