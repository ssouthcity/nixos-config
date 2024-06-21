{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.default    
  ];

  programs.nixvim = {
    enable = true;

    keymaps = [
      {
        action = "<cmd>Oil<cr>";
        key = "-";
        mode = "n";
        options = {
          desc = "Open parent directory";
          silent = true;
        };
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };
      oil = {
        enable = true;
      };
    };
  };
}
