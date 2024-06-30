{ config, pkgs, ... }:
with config.lib.stylix.colors.withHashtag;
{
  stylix.targets.tmux.enable = false;

  programs.tmux = {
    enable = true;
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
      set -g status-left '#[fg=${base01},bg=${base0D}] #S #[fg=${base0D},bg=default] '
      set -g window-status-current-format '#[fg=${base09},bg=default]#[fg=${base01},bg=${base09}]#I #[fg=default,bg=${base02}] #W #[fg=${base02},bg=default]'
      set -g window-status-format '#[fg=${base0A},bg=default]#[fg=${base01},bg=${base0A}]#I #[fg=default,bg=${base02}] #W #[fg=${base02},bg=default]'
      set -g status-right '#[fg=${base0D},bg=default]#[fg=${base01},bg=${base0D}] #(date "+%Y-%m-%d %H:%M") '

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
