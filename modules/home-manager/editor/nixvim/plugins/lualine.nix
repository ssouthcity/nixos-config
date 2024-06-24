{ pkgs, ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;

    componentSeparators = {
      left = "";
      right = "";
    };

    sectionSeparators = {
      left = "";
      right = "";
    };

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "" ];
      lualine_y = [ "filetype" ];
      lualine_z = [ "progress" ];
    };
  };

  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [ 
    nvim-web-devicons
  ];
}
