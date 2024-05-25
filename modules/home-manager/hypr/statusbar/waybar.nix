{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    catppuccin.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        margin = "20 0 20 4";
        spacing = 8;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
        ];
        modules-right = [
          "pulseaudio"
          "battery"
          "clock"
        ];

        pulseaudio = {
          format = "{volume}%\n  {icon}";
        };

        battery = {
          format = "{capacity}%\n  {icon}";
          format-icons = ["" "" "" "" ""];
        };

        clock = {
          format = "{:%H\n%M}";
        };
      };
    };

    style = ''
      * {
        all: initial;
        font-family: MesloLGL Nerd Font Mono, sans-serif;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces button {
        padding: 8px;
        border-radius: 20%;
        background: @base;
        color: @flamingo;
      }

      #clock,
      #pulseaudio,
      #battery {
        padding: 4px;
        border-radius: 20%;
        background: @base;
        color: @flamingo;
      }
    '';
  };
}
