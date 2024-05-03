--------------------------------------------------------------------------------
--                                  MAPPINGS                                  --
--------------------------------------------------------------------------------

-- leader key
vim.g.mapleader = ' '

-- resize
vim.keymap.set('n', '<M-j>', '<CMD>resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-k>', '<CMD>resize +2<CR>', { noremap = true })
vim.keymap.set('n', '<M-h>', '<CMD>vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-l>', '<CMD>vertical resize +2<CR>', { noremap = true })

-- escape
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kl', '<Esc>la', { noremap = true })

-- fix J
vim.keymap.set("n", "J", "mzJ`z")

-- avoid Q to run the last macro
vim.keymap.set("n", "Q", "A")

-- no delete copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- easy caps
vim.keymap.set('i', '<c-u>', '<ESC>viwUea', { noremap = true })

-- buffer navigation
vim.keymap.set('n', '<leader>bn', '<CMD>bnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bp', '<CMD>bprevious<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bk', '<CMD>bdelete<CR>', { noremap = true })

-- managing tabs
vim.keymap.set('n', '<leader>tn', '<CMD>tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>te', '<CMD>tabe %<CR>', { noremap = true })
vim.keymap.set('n', '<M-o>', '<CMD>tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<M-y>', '<CMD>tabprevious<CR>', { noremap = true })

-- move threw splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- add line bellow
vim.keymap.set('i', '<C-o>', '<CR><Esc>kA', { noremap = true })

-- move lines
vim.keymap.set('n', '<up>', '<CMD>move -2<cr>', { noremap = true })
vim.keymap.set('n', '<down>', '<CMD>move +1<cr>', { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- quick fix list
vim.keymap.set('n', '<leader>qo', '<CMD>copen<CR>', { noremap = true })
vim.keymap.set('n', '<leader>qc', '<CMD>cclose<CR>', { noremap = true })
vim.keymap.set('n', '<M-p>', '<CMD>cprev<CR>', { noremap = true })
vim.keymap.set('n', '<M-n>', '<CMD>cnext<CR>', { noremap = true })

-- substitution
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>', { noremap = true })
vim.keymap.set('v', '<leader>S', ':s//g<Left><Left>', { noremap = true })
vim.keymap.set('n', '<leader>*', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { noremap = true })

-- spell PROBLEME
vim.keymap.set('n', '<F6>', '<CMD>setlocal spell! spelllang=fr,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<F7>', '<CMD>set spelllang=en,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<leader>s', '<ESC>1z=', { noremap = true })
vim.keymap.set('n', '<left>', '[s', { noremap = true })
vim.keymap.set('n', '<right>', ']s', { noremap = true })

-- toggle auto comment on new line
vim.keymap.set('n', '<leader>t/', function()
  if vim.g.toggleCRO then
    vim.g.toggleCRO = false
    vim.cmd("setlocal formatoptions-=cro")
  else
    vim.g.toggleCRO = true
    vim.cmd("setlocal formatoptions+=cro")
  end
end, { noremap = true })

-- toggle virtual edit
vim.keymap.set('n', '<leader>tv', function()
  if vim.g.toggleVirtualEdit then
    vim.g.toggleVirtualEdit = false
    vim.cmd("setlocal virtualedit=")
  else
    vim.g.toggleVirtualEdit = true
    vim.cmd("setlocal virtualedit=all")
  end
end, { noremap = true })

-- toggle centering
vim.keymap.set('n', '<leader>tc', function()
  if vim.g.toggleCentering then
    vim.g.toggleCentering = false
    vim.opt.scrolloff = 0
    vim.opt.sidescrolloff = 0
  else
    vim.g.toggleCentering = true
    vim.opt.scrolloff = 999
    vim.opt.sidescrolloff = 999
  end
end, { noremap = true })

-- switch between light and dark bg
vim.keymap.set('n', '<leader>tl', function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  df_themeSettings()
end)

-- Explorer
vim.keymap.set('n', '<leader>e', '<CMD>vert split <BAR> Ex<CR>', { noremap = true })
vim.keymap.set('n', '<leader>x', '<CMD>Ex<CR>', { noremap = true })

-- rename file
vim.keymap.set('n', '<leader>R', function()
    local path = vim.fn.expand('%:h')
    local filename = vim.fn.expand('%:t')
    newname = vim.fn.input('rename file: ', '', 'file')
    os.rename(path .. "/" .. filename, path .. "/" .. newname)
    vim.api.nvim_buf_delete(0, { force = true })
    vim.cmd("e " .. path .. "/" .. newname)
end, { noremap = true })

-- remember folds
vim.keymap.set('n', '<leader>mkv', '<CMD>mkview<CR>', { noremap = true })

-- terminal
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>vt', '<CMD>vert split <bar> terminal<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vT', '<CMD>split <bar> terminal<CR>', { noremap = true })

-- netrw mapping (https://www.reddit.com/r/neovim/comments/ud2w4k/how_to_remap_netrw_to_n_in_keybindingsinitlua/)
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end
    -- mappings
    bind('l', '<CR>')
    bind('h', '-')
  end
})


-- remap keys that are difficult to reach

-- insert
vim.keymap.set('i', '<C-y>', '`', { noremap = true })
vim.keymap.set('i', '<C-_>', '<C-v>\\', { noremap = true })

-- remap the C-^
vim.keymap.set('n', '<C-p>', '<C-^>', { noremap = true })

-- yet another escape cmd
vim.keymap.set('v', '<C-Space>', '<Esc>', { noremap = true })

-- [ is difficult to reach on azerty keyboards
vim.keymap.set('n', 'viq', 'vi[', { noremap = true })
vim.keymap.set('n', 'vaq', 'va[', { noremap = true })
vim.keymap.set('n', 'yiq', 'yi[', { noremap = true })
vim.keymap.set('n', 'yaq', 'ya[', { noremap = true })
vim.keymap.set('n', 'diq', 'di[', { noremap = true })
vim.keymap.set('n', 'daq', 'da[', { noremap = true })
vim.keymap.set('n', 'ciq', 'ci[', { noremap = true })
vim.keymap.set('n', 'caq', 'ca[', { noremap = true })
