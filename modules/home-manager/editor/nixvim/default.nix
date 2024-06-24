{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.default    

    ./autocmds.nix
    ./highlight.nix
    ./keymaps.nix
    ./opts.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
  };
}
