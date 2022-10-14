-------------------------------------------------------------------------------
--                                    LSP:                                   --
-------------------------------------------------------------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

--------------------------------------------------------------------------------
--                                   severs                                   --
--------------------------------------------------------------------------------
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

--------------------------------------------------------------------------------
--                       mason (lsp utilities install)                        --
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>lM', '<CMD>Mason<CR>', { noremap = true })

--------------------------------------------------------------------------------
--                                  lsp saga                                  --
--------------------------------------------------------------------------------
local saga = require('lspsaga')

saga.init_lsp_saga()

--------------------------------------------------------------------------------
--                                lsp mappings                                --
--------------------------------------------------------------------------------

local lsp_buflsp_opt = { noremap=true, silent=false, buffer=bufnr }
local lsp_opt = { noremap=true, silent=false }

-- lspsaga
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gD', '<cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', lsp_buflsp_opt)
vim.keymap.set({'n', 'v'}, '<leader>la', '<cmd>Lspsaga code_action<CR>', lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', lsp_buflsp_opt)
vim.keymap.set('n', '<leader>le', '<cmd>Lspsaga show_cursor_diagnostics<CR>', lsp_opt)
vim.keymap.set('n', '<leader>lN', '<cmd>Lspsaga diagnostic_jump_prev<CR>', lsp_opt)
vim.keymap.set('n', '<leader>lP', '<cmd>Lspsaga diagnostic_jump_next<CR>', lsp_opt)
vim.keymap.set('n', '<leader>lo', '<cmd>LSoutlineToggle<CR>', lsp_opt)
vim.keymap.set('n', '<leader>T', '<cmd>Lspsaga open_floaterm<CR>', lsp_opt)
vim.keymap.set('t', '<C-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], lsp_opt)

-- lsp
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lsp_buflsp_opt)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_buflsp_opt)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lsh', vim.lsp.buf.signature_help, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lvr', vim.lsp.buf.references, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, lsp_buflsp_opt)
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_prev, lsp_opt)
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_next, lsp_opt)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, lsp_opt)

-- default Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=false }
-- vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, opts)
-- local bufopts = { noremap=true, silent=false, buffer=bufnr }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set('n', '<leader>lsh', vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set('n', '<leader>lwl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)
-- vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
-- vim.keymap.set({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set('n', '<leader>lvr', vim.lsp.buf.references, bufopts)
-- vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
