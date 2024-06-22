return function()
  require('lspconfig').clangd.setup({
    capabilities = require('dfconfig.lsp.cmp').capabilities,
    on_attach = require('dfconfig.lsp.lsp-config').on_attach,
    cmd = {
      "clangd",
      "--background-index",
      "--limit-results=500",
      "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
      "--clang-tidy",
      "--all-scopes-completion",
      "--cross-file-rename",
      "--completion-style=detailed",
      "--completion-parse=always",
      "--include-ineligible-results",
      "--function-arg-placeholders",
      "--header-insertion=iwyu",
      "--compile-commands-dir=../build/",
    }
  })
end
