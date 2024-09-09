{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      allow_images = true;
      allow_markup = true;
      normal_window = true;
      no_actions = true;
      sort_order = "alphabetical";
      image_size = 48;
    };
    style = ''
      window {
        font-size: 1.25em;
      }

      #input, #entry {
        padding: .25em .5em;
      }

      #entry image {
        margin-right: 1em;
      }
    '';
  };
}
