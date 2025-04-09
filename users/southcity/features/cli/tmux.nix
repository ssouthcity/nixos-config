{
  config,
  pkgs,
  ...
}:
with config.lib.stylix.colors.withHashtag;
let
  fullColorPill =
    bgColor: fgColor: content:
    "#[fg=${bgColor},bg=default]"
    + "#[fg=${fgColor},bg=${bgColor}]${content}"
    + "#[fg=${bgColor},bg=default]";

  halfColorPill =
    leftBgColor: leftFgColor: leftContent: rightBgColor: rightFgColor: rightContent:
    "#[fg=${leftBgColor},bg=default]"
    + "#[fg=${leftFgColor},bg=${leftBgColor}]${leftContent}"
    + "#[fg=${rightFgColor},bg=${rightBgColor}]${rightContent}"
    + "#[fg=${rightBgColor},bg=default]";
in
{
  stylix.targets.tmux.enable = false;

  programs.tmux = {
    enable = true;
    shortcut = "a";
    clock24 = true;
    terminal = "tmux-256color";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    extraConfig = ''
      # Status Bar
      set -g renumber-windows on
      set -g status-position top

      set -g status-style bg=default,fg=default

      set -g status-left-length 80
      set -g status-left '${fullColorPill base0D base00 "#S"} '
      set -g window-status-current-format '${halfColorPill base0A base00 "#I " base02 "default" " #W"}'
      set -g window-status-format '${halfColorPill base04 base00 "#I " base01 "default" " #W"}'
      set -g status-right '${fullColorPill base0D base01 "#(date \"+%Y-%m-%d %H:%M\")"}'

      # System Integration
      set -g set-clipboard on
      set -g mouse on
      set -g focus-events on

      # Creating Windows and Panes
      bind c new-window -c '#{pane_current_path}'
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'

      # Navigation
      bind -n M-H previous-window
      bind -n M-L next-window
    '';

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
  };
}
