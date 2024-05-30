{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-bottom = 0;
        margin-top = 8;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "custom/launcher"
          "cpu"
          "memory"
          "tray"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "pulseaudio"
          "clock"
          "battery"
          "custom/power"
        ];

        pulseaudio = {
          tooltip = false;
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-muted = "{icon} {volume}%";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 4;
          };
        };

        network = {
          tooltip = false;
          format-wifi = " {essid}";
          format-ethernet = "";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        tray ={
          icon-size = 18;
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M %a}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          interval = 15;
          format = " {}%";
          max-length = 10;
        };

        memory = {
          interval = 30;
          format = " {}%";
          max-length = 10;
        };

        "custom/power" = {
          format = "";
          on-click = "rofi -show power-menu";
          tooltip = false;
        };

        "custom/launcher" = {
          format = "";
          on-click = "rofi -show drun";
          on-click-right = "killall rofi";
          tooltip = false;
        };
      };
    };

    style = ''
    * {
      font-family: MesloLGS Nerd Font Mono;
      font-size: 16px;
      border: none;
      border-radius: 0px;
      min-height: 0;
      background: transparent;
    }

    #waybar > box {
      padding: 4px;
    }

    tooltip,
    .module {
      padding: 0px 16px;

      color: @theme_fg_color;
      background: @theme_bg_color;

      border-style: solid;
      border-width: 2px;
      border-color: @theme_fg_color;
      border-radius: 10px;

      box-shadow: 0px 0px 4px 2px #1a1a1a;
    }
    '';
  };
}
