{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xx";
      mode = "n";
      options = {
        desc = "Diagnostics";
        silent = true;
      };
    }
    {
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      key = "<leader>xX";
      mode = "n";
      options = {
        desc = "Buffer Diagnostics";
        silent = true;
      };
    }
  ];

  programs.nixvim.plugins.trouble = {
    enable = true;
  };
}
