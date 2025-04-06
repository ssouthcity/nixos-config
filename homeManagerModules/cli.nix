{ ... }:
{
  programs.bash = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.eza = {
    enable = true;
    icons = "always";
  };

  programs.fzf = {
    enable = true;
  };

  programs.git = { 
    enable = true; 
    aliases = {
      amend = "commit --amend --no-edit";
      force = "push --force-if-includes --force-with-lease";
      noop = "commit --allow-empty -m 'noop'";
      nvm = "!git reset --hard HEAD && git clean -d -f";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };

  programs.jq = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
