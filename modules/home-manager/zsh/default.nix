{
  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";

    enableCompletion = true;

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
    };

    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    autocd = true;

    defaultKeymap = "viins";

    prezto = {
      enable = true;

      editor = {
        keymap = "vi";
      };

      tmux = {
        autoStartLocal = true;
        autoStartRemote = true;
        defaultSessionName = "default";
      };

      utility = {
        safeOps = true;
      };

      pmodules = [
        "autosuggestions"
        "completion"
        "directory"
        "editor"
        "environment"
        "history"
        "spectrum"
        "syntax-highlighting"
        "terminal"
        "tmux"
        "utility"
      ];
    };
  };
}
