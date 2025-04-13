return function()
  vim.lsp.config.ltex = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
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
