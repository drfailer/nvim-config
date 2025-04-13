--------------------------------------------------------------------------------
--                                   Mason                                    --
--------------------------------------------------------------------------------

function default_handler(language)
  vim.lsp.config[language] = {
    capabilities = require('dfconfig.lsp.cmp').capabilities,
  }
  vim.lsp.enable(language)
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'ltex',
  },
  handlers = {
    default_handler,
    ltex = require('dfconfig.lsp.languages.ltex'),
    clangd = require('dfconfig.lsp.languages.clangd'),
  },
})
