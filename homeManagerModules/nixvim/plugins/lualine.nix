{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "" ];
        lualine_y = [ "filetype" ];
        lualine_z = [ "progress" ];
      };

      options = {
        globalstatus = true;

        component_separators = {
          left = "";
          right = "";
        };

        section_separators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
