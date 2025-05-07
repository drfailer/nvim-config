--------------------------------------------------------------------------------
--                                    lsp                                     --
--------------------------------------------------------------------------------

-- diagnostic
vim.diagnostic.config({
  virtual_text = true,
  float = { border = "rounded" },
})

-- log
vim.lsp.set_log_level('trace')
require('vim.lsp.log').set_format_func(vim.inspect)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_group', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then return end

    local opts = { noremap = true }

    local tb = require("telescope.builtin")

    -- generic mappings
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ border = 'rounded', })
    end, { buffer = args.buf })
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", tb.lsp_definitions, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>ls", tb.lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>lS", tb.lsp_workspace_symbols, opts)
    vim.keymap.set("n", "<leader>lR", tb.lsp_references, opts)
    vim.keymap.set("n", "<leader>lfd", tb.diagnostics, opts)
    vim.keymap.set("n", "<leader>lft", tb.lsp_type_definitions, opts)
    vim.keymap.set("n", "<leader>lfi", tb.lsp_implementations, opts)

    -- signature help
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end
  end,
})
