{ pkgs, ... }:
{
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
      # theme
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
        set -g @catppuccin_flavour "mocha"
        set -g @catppuccin_window_tabs_enabled on
        set -g @catppuccin_date_time "%H:%M"
        set -g @catppuccin_status_modules "session battery date_time"
        '';
      }
      tmuxPlugins.battery
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
