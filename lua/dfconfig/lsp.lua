--------------------------------------------------------------------------------
--                                    lsp                                     --
--------------------------------------------------------------------------------

-- vim.lsp.enable({ "clangd" });

-- diagnostic
vim.diagnostic.config({
  virtual_text = true,
  float = { border = "rounded" },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_group', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then return end

    local opts = { noremap = true }

    -- generic mappings
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ border = 'rounded', })
    end, { buffer = args.buf })

    -- g commands
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)

    -- goto
    vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, opts)

    -- buffer change
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, opts)

    -- diagnostic
    vim.keymap.set("n", "<leader>ldo", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ldn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>ldp", vim.diagnostic.goto_prev, opts)

    -- symbols
    vim.keymap.set("n", "<leader>lsd", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "<leader>lsw", vim.lsp.buf.workspace_symbol, opts)

    -- types
    vim.keymap.set("n", "<leader>ltd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>lth", vim.lsp.buf.typehierarchy, opts)

    -- calls
    vim.keymap.set("n", "<leader>lci", vim.lsp.buf.incoming_calls, opts)
    vim.keymap.set("n", "<leader>lco", vim.lsp.buf.outgoing_calls, opts)

    -- workspace actions
    vim.keymap.set("n", "<leader>lwl", vim.lsp.buf.list_workspace_folders, opts)
    vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)

    -- signature help
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end
  end,
})
