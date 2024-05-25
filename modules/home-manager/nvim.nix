{ inputs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile = {
    "nvim".source = inputs.dotfiles + "/.config/nvim";
  };
}
