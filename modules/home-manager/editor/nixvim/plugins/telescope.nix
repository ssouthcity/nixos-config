{
  programs.ripgrep.enable = true;

  programs.nixvim.plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>b" = "buffers";
    };

    settings = {
      defaults = {
        path_display = [ "truncate" ];
        layout_config = {
          prompt_position = "top";
        };
      };
    };
  };
}
