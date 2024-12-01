{
  programs.nixvim.plugins.lsp = {
    enable = true;
    keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";

        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
      };
    };
    servers = {
      gopls.enable = true;
      hls = {
        enable = true;
        installGhc = false;
      };
      nixd.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      templ.enable = true;
      terraformls.enable = true;
    };
  };
}
