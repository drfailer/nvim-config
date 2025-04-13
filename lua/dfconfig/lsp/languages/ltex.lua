return function()
  vim.lsp.config.ltex = {
    capabilities = require("dfconfig.lsp.cmp").capabilities,
    filetypes = { 'tex', 'latex' },
    settings = {
      ltex = {
        -- language = "fr",
        language = "en",
      },
    },
  }
  vim.lsp.enable("ltex")
end
