vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

--------------------------------------------------------------------------------
--                                   Mason                                    --
--------------------------------------------------------------------------------

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'rust_analyzer',
    -- 'bashls',
    'ltex',
    -- 'tsserver'
  },
  handlers = {
    lsp.default_setup,
    ltex = function()
      require('lspconfig').ltex.setup({
        filetypes = { 'tex', 'latex' },
        settings = {
          ltex = {
            language = "fr",
          },
        },
      })
    end,
  },
})

--------------------------------------------------------------------------------
--                                    lsp                                     --
--------------------------------------------------------------------------------

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- mappings
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lvr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

--------------------------------------------------------------------------------
--                                    cmp                                     --
--------------------------------------------------------------------------------

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

local cmp_select = {behavior = cmp.SelectBehavior.Insert}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-j>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = nil,
  ['<Tab>'] = nil,
  ['<S-Tab>'] = nil,
})

cmp.setup({
  mapping = cmp_mappings,
  preselect = 'item',
  formatting = cmp_format,
  completion = {
      completeopt = 'menu,menuone,noselect'
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  }
})

--------------------------------------------------------------------------------
--                                  snippets                                  --
--------------------------------------------------------------------------------

-- snipmate like snippet load
require("luasnip.loaders.from_snipmate").lazy_load()

-- luasnip mappings
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
vim.cmd("inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>")
vim.cmd("snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>")
vim.cmd("snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")
vim.cmd("imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'")
vim.cmd("smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'")
