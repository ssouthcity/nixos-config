let
  transparent = {
    bg = "none";
    ctermbg = "none";
  };
in
{
  programs.nixvim.highlight = {
    Normal = transparent;
    NonText = transparent;
    SignColumn = transparent;
    LineNr = transparent;
    StatusLine = transparent;
  };
}
