--------------------------------------------------------------------------------
--                                  MAPPINGS                                  --
--------------------------------------------------------------------------------

-- leader key
vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- sudo edit
map('c', 'w!!', 'w !sudo tee %', {})

-- resize
map('n', '<M-j>', '<CMD>resize -2<CR>', { noremap = true })
map('n', '<M-k>', '<CMD>resize +2<CR>', { noremap = true })
map('n', '<M-h>', '<CMD>vertical resize -2<CR>', { noremap = true })
map('n', '<M-l>', '<CMD>vertical resize +2<CR>', { noremap = true })

-- escpae
map('i', 'kj', '<Esc>', { noremap = true })
map('i', 'kl', '<Esc>la', { noremap = true })

-- easy caps
map('i', '<c-u>', '<ESC>viwUea', { noremap = true })

-- buffer navigation
map('n', '<leader>nb', '<CMD>bnext<CR>', { noremap = true })
map('n', '<leader>bp', '<CMD>bprevious<CR>', { noremap = true })

-- managing tabs
map('n', '<leader>tn', '<CMD>tabnew<CR>', { noremap = true })
map('n', '<leader>>', '<CMD>tabnext<CR>', { noremap = true })
map('n', '<leader><', '<CMD>tabprevious<CR>', { noremap = true })

-- indent
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- move threw splits
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- move in noremal mode
map('i', '<C-a>', '<Esc>I', { noremap = true })
map('i', '<C-e>', '<Esc>A', { noremap = true })
map('i', '<C-f>', '<Esc>la', { noremap = true })
map('i', '<C-b>', '<Esc>i', { noremap = true })
map('i', '<C-o>', '<CR><Esc>kA', { noremap = true })

-- move lines
map('n', '<up>', '<CMD>move -2<cr>', { noremap = true })
map('n', '<down>', '<CMD>move +1<cr>', { noremap = true })

-- quick fix list
map('n', '<leader>qo', '<CMD>copen<CR>', { noremap = true })
map('n', '<leader>qc', '<CMD>cclose<CR>', { noremap = true })
map('n', '<C-p>', '<CMD>previous<CR>', { noremap = true })
map('n', '<C-n>', '<CMD>cnext<CR>', { noremap = true })

-- substitution
map('n', '<leader>S', ':%s//g<Left><Left>', { noremap = true })
map('v', '<leader>S', ':s//g<Left><Left>', { noremap = true })
map('n', '<leader>*', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { noremap = true })

-- spell PROBLEME
map('n', '<F6>', '<CMD>setlocal spell! spelllang=fr,cjk<cr>', { noremap = true })
map('n', '<F7>', '<CMD>set spelllang=en,cjk<cr>', { noremap = true })
map('n', '<M-;>', '<ESC>1z=', { noremap = true })
map('n', '<left>', '[s', { noremap = true })
map('n', '<right>', ']s', { noremap = true })

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


-- Explorer
map('n', '<leader>e', '<CMD>NvimTreeToggle<CR>', { noremap = true })
-- map('n', '<leader>e', '<CMD>vert split <BAR> Ex<CR>', { noremap = true })
-- map('n', '<leader>x', '<CMD>Ex<CR>', { noremap = true })

-- remember folds
map('n', '<leader>mkv', '<CMD>mkview<CR>', { noremap = true })

-- terminal
map('t', '<C-h>', '<C-\\><C-n>', { noremap = true })
map('n', '<leader>vt', '<CMD>vert split <bar> terminal<CR>', { noremap = true })
map('n', '<leader>vtt', '<CMD>split <bar> terminal<CR>', { noremap = true })

-- fugitive
map('n', '<leader>gg', '<CMD>G<cr>', { noremap = true })
map('n', '<leader>gc', '<CMD>G commit<cr>', { noremap = true })
map('n', '<leader>gp', '<CMD>G push<cr>', { noremap = true })
map('n', '<leader>gL', '<CMD>G log<cr>', { noremap = true })
map('n', '<leader>gm', ':G merge ', { noremap = true })
map('n', '<leader>gd', ':Gvdiffsplit!<cr>', { noremap = true })
map('n', '<leader>gh', '<CMD>diffget //2<cr>', { noremap = true })
map('n', '<leader>gl', '<CMD>diffget //3<cr>', { noremap = true })
map('n', '<leader>gj', ']c', { noremap = true })
map('n', '<leader>gk', '[c', { noremap = true })
