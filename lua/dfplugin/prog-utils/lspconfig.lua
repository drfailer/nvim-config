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

-- custom symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { os.getenv("HOME") .. '/.local/share/nvim/mason/bin/rust-analyzer' },
    settings = {
      ["rust-analyzer"] = {}
    }
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
local map = vim.keymap.set

-- lspsaga
map('n',         'gh', '<cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
map('n',         'gD', '<cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true })
map('n',          'K', '<cmd>Lspsaga hover_doc<CR>', lsp_buflsp_opt)
map('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', lsp_buflsp_opt)
map('n', '<leader>le', '<cmd>Lspsaga show_cursor_diagnostics<CR>', lsp_opt)
map('n', '<leader>ln', '<cmd>Lspsaga diagnostic_jump_prev<CR>', lsp_opt)
map('n', '<leader>lp', '<cmd>Lspsaga diagnostic_jump_next<CR>', lsp_opt)
map('n', '<leader>lo', '<cmd>LSoutlineToggle<CR>', lsp_opt)
map('n',  '<leader>tt', '<cmd>Lspsaga open_floaterm<CR>', lsp_opt)
map('t',      '<C-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], lsp_opt)
map({'n', 'v'}, '<leader>la', '<cmd>Lspsaga code_action<CR>', lsp_buflsp_opt)

-- lsp
map('n', 'gd', vim.lsp.buf.definition, lsp_buflsp_opt)
map('n', '<leader>lsh', vim.lsp.buf.signature_help, lsp_buflsp_opt)
map('n', '<leader>lvr', vim.lsp.buf.references, lsp_buflsp_opt)
map('n', '<leader>ld', vim.diagnostic.setloclist, lsp_opt)
map('n', '<leader>lF', function() vim.lsp.buf.format { async = true } end, lsp_buflsp_opt)

-- workspace
map('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, lsp_buflsp_opt)
map('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, lsp_buflsp_opt)
map('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, lsp_buflsp_opt)

-- unused
-- map('n', 'gD', vim.lsp.buf.declaration, lsp_buflsp_opt)
-- map('n', 'gi', vim.lsp.buf.implementation, lsp_buflsp_opt)
-- map('n', '<leader>lD', vim.lsp.buf.type_definition, lsp_buflsp_opt)
-- map('n', '<leader>lR', vim.lsp.buf.rename, lsp_buflsp_opt)
-- map('n', '<leader>lN', vim.diagnostic.goto_prev, lsp_opt)
-- map('n', '<leader>lP', vim.diagnostic.goto_next, lsp_opt)
