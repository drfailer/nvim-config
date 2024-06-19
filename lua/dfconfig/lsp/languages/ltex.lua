return function()
  require('lspconfig').ltex.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'tex', 'latex' },
    settings = {
      ltex = {
        -- language = "fr",
        language = "en",
      },
    },
  })
end
