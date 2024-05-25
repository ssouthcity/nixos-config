{
  home.sessionVariables = {
    VI_MODE_SET_CURSOR = "true";
    ZSH_TMUX_AUTOSTART_ONCE = "true";
  };

  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";

    enableCompletion = true;

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      catppuccin.enable = true;
    };

    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    defaultKeymap = "viins";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "azure"
        "cabal"
        "catimg"
        "direnv"
        "docker"
        "fzf"
        "git"
        "golang"
        "kubectl"
        "nvm"
        "pyenv"
        "rust"
        "starship"
        "terraform"
        "tmux"
        "web-search"
      ];
    };
  };
}
