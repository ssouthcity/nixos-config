{
  programs.nixvim.autoCmd = [
    {
      event = "TextYankPost";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    {
      event = "BufWritePre";
      callback = {
        __raw = ''
          function(ev)
            vim.lsp.buf.format({ 
              bufnr = ev.bufnr,
              filter = function(client)
                return client.server_capabilities.documentFormattingProvider
              end
            })
          end
        '';
      };
    }
  ];
}
