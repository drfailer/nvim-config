--------------------------------------------------------------------------------
--                                  SETTINGS                                  --
--------------------------------------------------------------------------------

local o = vim.opt

o.termguicolors = true

o.hidden = true
o.wrap = false
o.ruler = true
o.cmdheight = 1
o.pumheight = 10
o.history = 50
o.signcolumn = 'yes'
o.cursorline = true
o.textwidth = 80
o.list = false
o.clipboard = 'unnamedplus'
o.colorcolumn = "80"
o.scrolloff = 0
o.sidescrolloff = 0
o.showmode = false
o.updatetime = 300
o.timeoutlen = 500
vim.o.conceallevel = 0
vim.o.hlsearch = false

-- numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2

-- tab and indent
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.smartindent = true
o.cindent = true

-- cases
o.ignorecase = true
o.smartcase = true

-- no backups or swap
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- splits
o.splitright = true
o.splitbelow = true

-- mouse
o.mouse = "a"

-- encoding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

-- fold
o.foldmethod = 'marker'

-- formating
vim.o.formatoptions = vim.o.formatoptions .. 'tcrqnj'
vim.g.toggleCRO = true
vim.g.toggleVirtualEdit = false

-- completion
o.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
o.wildmode = {'longest', 'list', 'full'}

-- other options
vim.api.nvim_command('set guicursor=')
vim.api.nvim_command('set path+=**')

vim.g.netrw_banner = 0

--------------------------------------------------------------------------------
-- auto comands
--------------------------------------------------------------------------------

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- trim whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- detect filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tex" },
  command = [[set ft=tex]],
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pde" },
  command = [[set ft=java]],
})
