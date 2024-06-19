--------------------------------------------------------------------------------
--                                   Mason                                    --
--------------------------------------------------------------------------------

function default_handler(language)
  require('lspconfig')[language].setup({
    capabilities = require('dfconfig.lsp.cmp').capabilities,
    on_attach = require('dfconfig.lsp.lsp-config').on_attach,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'rust_analyzer',
    'ltex',
  },
  handlers = {
    vim.lsp.default_setup,
    ltex = require('dfconfig.lsp.languages.ltex'),
    clangd = require('dfconfig.lsp.languages.clangd'),
    rust_analyzer = default_handler('rust_analyzer'),
  },
})
