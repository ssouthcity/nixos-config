{
  programs.git = {
    enable = true;
    userName = "Stian Sørby";
    userEmail = "51554341+ssouthcity@users.noreply.github.com";
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
}
