{ config, lib, ... }:
let
  cfg = config.modules.git;
in 
{
  options.modules.git = {
    enable = lib.mkEnableOption "git module";
    userName = lib.mkOption {
      type = lib.types.str;
      default = "Stian Sørby";
    };
    userEmail = lib.mkOption {
      type = lib.types.str;
      default = "51554341+ssouthcity@users.noreply.github.com";
    };
    wslCredentialHelper = {
      enable = lib.mkEnableOption "wsl git credential helper"; 
    };
    useHttpPath = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = { 
      enable = true; 
      userName = cfg.userName;
      userEmail = cfg.userEmail;
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
        credential = lib.mkIf cfg.wslCredentialHelper.enable {
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
          useHttpPath = cfg.useHttpPath;
        };
      };
    };
  };
}
