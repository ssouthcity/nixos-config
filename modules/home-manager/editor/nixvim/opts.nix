{
  programs.nixvim.opts = {
    # line numbers
    relativenumber = true;
    number = true;

    # indentation
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;

    # search
    ignorecase = true;
    smartcase = true;

    # cursor highlight
    cursorline = true;

    # vibrant colors
    termguicolors = true;

    # backspace behavior
    backspace = "indent,eol,start";

    # split windows
    splitright = true;
    splitbelow = true;

    # sign column always present
    signcolumn = "yes";
  };
}
