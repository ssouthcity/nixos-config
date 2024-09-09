{ config, ... }:

{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-bottom = 0;
        margin-top = 8;
        margin-left = 20;
        margin-right = 20;
        spacing = 32;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "tray"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
        ];

        "custom/launcher" = {
          format = "";
          on-click = "rofi -show drun";
          on-click-right = "killall rofi";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
          on-click = "activate";
          persistent-workspaces = {
            "*" = 4;
          };
        };

        network = {
          format-disconnected = " Disconnected";
          format-ethernet = "󱘖 Wired";
          format-linked = "󱘖 {ifname} (No IP)";
          format-wifi = "󰤨 {essid}";
          interval = 5;
          max-length = 30;
          tooltip-format = ''
            󱘖 {ipaddr}
             {bandwidthUpBytes}
             {bandwidthDownBytes}'';
        };

        bluetooth = {
          format = "";
          format-connected = " {num_connections}";
          format-disabled = "";
          tooltip-format = " {device_alias}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-icons = {
            car = "";
            default = ["" "" ""];
            hands-free = "";
            headphone = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {volume}%";
          on-click = "pavucontrol -t 3";
          on-click-right = "pamixer -t";
          on-scroll-down = "pamixer -d 5";
          on-scroll-up = "pamixer -i 5";
          scroll-step = 5;
          tooltip-format = "{icon} {desc} {volume}%";
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

        tray = {
          icon-size = 16;
          spacing = 16;
        }; 
      };
    };

    style = ''
      * {
        font-family: ${config.stylix.fonts.monospace.name};  
      }

      window#waybar {
        border-radius: 500px;
      }

      window#waybar > box {
        padding-left: 32px;
        padding-right: 32px;
      }

      #custom-launcher {
        font-size: 1.5em;
      }
    '';
  };
}
