--------------------------------------------------------------------------------
--                                    lsp                                     --
--------------------------------------------------------------------------------

local lsp_config = {}

-- diagnostic
vim.diagnostic.config({
    virtual_text = true,
})

-- log
vim.lsp.set_log_level('trace')
require('vim.lsp.log').set_format_func(vim.inspect)

-- mappings
lsp_config.on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- generic mappings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lvr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, opts)

  -- signature help
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
end

return lsp_config
