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
vim.o.incsearch = true

-- numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2

-- tab and indent
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
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
vim.g.custom_fold = false
o.foldmethod = 'marker'
function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local text = vim.fn.substitute(line, '{{{', '', 'g')
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return text .. " • (" .. line_count .. " L)"

end
if vim.g.custom_fold then
  vim.opt.foldtext = 'v:lua.custom_fold_text()'
  vim.opt.fillchars = { fold = ' ' }
end

-- formating
vim.o.formatoptions = vim.o.formatoptions .. 'tcrqnj'
vim.g.toggleCRO = true
vim.g.toggleVirtualEdit = false

-- completion
o.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
-- o.completeopt = {'menu', 'menuone', 'noselect'}
o.wildmode = {'longest', 'list', 'full'}

o.guicursor = ""

vim.g.netrw_banner = 0

--------------------------------------------------------------------------------
--                                auto comands                                --
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

--------------------------------------------------------------------------------
--                                   viwiki                                   --
--------------------------------------------------------------------------------

vim.g.vimwiki_list = {
  {
    path = '~/Documents/wiki/',
    syntax = 'markdown',
    ext = '.md',
    nested_syntaxes = {
      python = 'python',
      cpp = 'cpp',
      c = 'c',
      haskell = 'haskell',
      rust = 'rust',
      sh = 'sh',
      bash = 'sh',
      cmake = 'cmake',
    }
  }
}

-- markdown headers
-- vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = "#b8bb26", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = "#fabd2f", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = "#d3869b", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader4', { fg = "#fb4934", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader5', { fg = "#8ec07c", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader6', { fg = "#fe8819", bold = true })
