{ config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = {
      monitor = ", preferred, auto, auto";

      env = [
        # NixOS
        "NIXOS_OZONE_WSL,1"
        "XDG_SESSION_TYPE,wayland"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"

        # Nvidia drivers specific
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      debug = {
        disable_logs = false;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bind = [
        "SUPER, T, exec, kitty"
      ];

      exec-once = [
        "hyprpaper"
      ];
    };

    # settings = {
    #   monitor = ", preferred, auto, 1";

    #   env = [
    #     "NIXOS_OZONE_WSL,1"
    #     "XDG_SESSION_TYPE,wayland"
    #     "WLR_NO_HARDWARE_CURSORS,1"
    #     "XCURSOR_THEME,${config.stylix.cursor.name}"
    #     "XCURSOR_SIZE,${toString config.stylix.cursor.size}"
    #   ];

    #   input = {
    #     kb_layout = "us";
    #     kb_variant = "intl";

    #     follow_mouse = 1;

    #     touchpad = {
    #       natural_scroll = true;
    #       scroll_factor = 0.2;
    #       clickfinger_behavior = true;
    #     };
    #   }; 

    #   general = {
    #     gaps_in = 10;
    #     gaps_out = 20;

    #     layout = "dwindle";

    #     border_size = 0;
    #   };

    #   misc = {
    #     disable_hyprland_logo = true;
    #     disable_splash_rendering = true;

    #     enable_swallow = true;
    #     swallow_regex = "^(kitty)$";
    #   };

    #   decoration = {
    #     rounding = 10;

    #     blur = {
    #       enabled = true;
    #       size = 3;
    #       passes = 3;
    #       new_optimizations = true;
    #     };

    #     active_opacity = 1.0;
    #     inactive_opacity = 0.9;
    #     fullscreen_opacity = 1.0;

    #     drop_shadow = true;
    #     shadow_range = 32;
    #     shadow_render_power = 8;
    #   };

    #   animations = {
    #     enabled = true;
    #     bezier = [
    #       "customBezier, 0.05, 0.9, 0.1, 1.0"
    #     ];
    #     animation = [
    #       "windows, 1, 7, customBezier"
    #       "windowsOut, 1, 7, default, popin 80%"
    #       "border, 1, 10, default"
    #       "borderangle, 1, 8, default"
    #       "fade, 1, 7, default"
    #       "workspaces, 1, 6, default"
    #     ];
    #   };

    #   dwindle = {
    #     pseudotile = true;
    #     preserve_split = true;
    #   };

    #   master = {
    #     new_is_master = true;
    #   };

    #   bind = [
    #     "SUPER, RETURN, exec, kitty"
    #     "SUPER, Space, exec, wofi"
    #     "SUPER, B, exec, firefox"
    #     "SUPER, E, exec, nautilus"
    #     "SUPER SHIFT, E, exec, rofi -show filebrowser"
    #     "SUPER SHIFT, W, exec, rofi -show window"
    #     "SUPER, Q, killactive"
    #     "SUPER SHIFT, Q, exec, rofi -show power-menu"
    #     "SUPER, F, fullscreen, 1"
    #     "SUPER_SHIFT, F, fullscreen, 0"
    #     "SUPER, T, togglefloating"
    #     "SUPER, P, pseudo"
    #     "SUPER, V, togglesplit"

    #     "SUPER, 1, workspace, 1"
    #     "SUPER, 2, workspace, 2"
    #     "SUPER, 3, workspace, 3"
    #     "SUPER, 4, workspace, 4"

    #     "SUPER SHIFT, 1, movetoworkspacesilent, 1"
    #     "SUPER SHIFT, 2, movetoworkspacesilent, 2"
    #     "SUPER SHIFT, 3, movetoworkspacesilent, 3"
    #     "SUPER SHIFT, 4, movetoworkspacesilent, 4"

    #     "SUPER, h, movefocus, l"
    #     "SUPER, l, movefocus, r"
    #     "SUPER, j, movefocus, d"
    #     "SUPER, k, movefocus, u"

    #     "SUPER_SHIFT, h, movewindow, l"
    #     "SUPER_SHIFT, l, movewindow, r"
    #     "SUPER_SHIFT, j, movewindow, d"
    #     "SUPER_SHIFT, k, movewindow, u"

    #     "SUPER, s, exec, hyprshot -m region"
    #     "SUPER_SHIFT, s, exec, hyprshot -m region --clipboard-only"

    #     "SUPER, PRINT, exec, hyprshot -m output --current"
    #     "SUPER_SHIFT, PRINT, exec, hyprshot -m output --clipboard-only -current"

    #     "SUPER_SHIFT, l, exec, hyprlock"
    #   ];

    #   bindm = [
    #     "SUPER, mouse:272, movewindow"
    #     "SUPER, mouse:273, resizewindow"
    #   ];

    # };
  };
}
