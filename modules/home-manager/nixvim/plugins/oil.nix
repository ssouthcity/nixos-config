{
  programs.nixvim.keymaps = [
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
  
  programs.nixvim.plugins.oil = {
    enable = true;

    settings = {
      columns = ["icon"];
      keymaps = {
        "<C-h>" = false;
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
      };
      view_options = {
        show_hidden = true;
      };
    };
  };
}
