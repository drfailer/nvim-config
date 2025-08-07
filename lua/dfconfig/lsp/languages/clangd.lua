return function()
  vim.lsp.config.clangd = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = {
      "clangd",
      "--background-index",
      -- "--limit-results=500",
      "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
      "--clang-tidy",
      -- "--all-scopes-completion",
      "--cross-file-rename",
      "--completion-style=detailed",
      -- "--completion-parse=always",
      -- "--include-ineligible-results",
      "--function-arg-placeholders",
      "--header-insertion=iwyu",
      "--compile-commands-dir=../build/",
    }
  }
  vim.lsp.enable("clangd")
end
