{
  programs.nixvim.plugins.luasnip = {
    enable = true;
  };

  programs.nixvim.plugins.friendly-snippets = {
    enable = true;
  };

  programs.nixvim.plugins.cmp = {
    enable = true;

    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<C-e>" = "cmp.mapping.close()";
      };
    };
  };
}
