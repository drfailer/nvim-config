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
    -- 'rust_analyzer',
    'ltex',
  },
  handlers = {
    default_handler,
    ltex = require('dfconfig.lsp.languages.ltex'),
    clangd = require('dfconfig.lsp.languages.clangd'),
  },
})
