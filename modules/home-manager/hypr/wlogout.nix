{ config, ... }:
{
  programs.wlogout = {
    enable = true;
    style = ''
    * {
      background-image: none;
      box-shadow: none;
    }

    window {
      background-color: @theme_bg_color;
    }

    button {
      border-radius: 16px;
      border-color: @theme_fg_color;
      border-style: solid;
      border-width: 2px;

      text-decoration-color: @theme_text_color;
      color: @theme_text_color;

      background-color: @theme_bg_color;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;

      margin: 8px;
    }

    button:focus, button:active, button:hover {
      background-color: @theme_selected_fg_color;
      outline-style: none;
    }

    #lock {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/lock.png"));
    }

    #logout {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/logout.png"));
    }

    #suspend {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/suspend.png"));
    }

    #hibernate {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/hibernate.png"));
    }

    #shutdown {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/shutdown.png"));
    }

    #reboot {
        background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/reboot.png"));
    }
    '';
  };
}
