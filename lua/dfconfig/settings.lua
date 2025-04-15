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
o.cursorline = false
o.textwidth = 80
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

-- listchars (for showing tabs and spaces)
vim.opt.list = false
vim.opt.listchars = {
    lead = '·',
    trail = '~',
    tab = '>·',
    space = '·',
    eol = '¬',
    extends = '>',
    precedes = '<'
}

-- cases
o.ignorecase = false
o.smartcase = false

-- no backups or swap
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- splits
o.splitright = true
o.splitbelow = true

-- encoding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

-- formating
vim.o.formatoptions = vim.o.formatoptions .. 'tcrqnj'
vim.g.toggleCRO = true
vim.g.toggleVirtualEdit = false

-- completion
o.completeopt = {'menu', 'menuone', 'noselect'}

-- interface
o.guicursor = ""
o.mouse = "a"

-- netrw
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

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

--------------------------------------------------------------------------------
--                                  vimwiki                                   --
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

--------------------------------------------------------------------------------
--                                    fold                                    --
--------------------------------------------------------------------------------

function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local text = vim.fn.substitute(line, '{{{', '', 'g')
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    -- return "  " .. text .. " (" .. line_count .. " L)"
    return text .. " (" .. line_count .. " L)"
end

vim.g.custom_fold = true
vim.opt.foldmethod = 'marker'

if vim.g.custom_fold then
  vim.opt.foldtext = 'v:lua.custom_fold_text()'
  vim.opt.fillchars = { fold = ' ' }
end
