--------------------------------------------------------------------------------
--                                   Mason                                    --
--------------------------------------------------------------------------------

function default_handler(language)
  vim.lsp.config[language] = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
  vim.lsp.enable(language)
  print("default handler called for ", language)
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'texlab',
    -- 'ltex',
  },
  handlers = {
    default_handler,
    -- ltex = require('dfconfig.lsp.languages.ltex'),
    clangd = require('dfconfig.lsp.languages.clangd'),
  },
})
