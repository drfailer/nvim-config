--------------------------------------------------------------------------------
--                                  MAPPINGS                                  --
--------------------------------------------------------------------------------

-- leader key
vim.g.mapleader = ' '

vim.keymap.set('c', 'w!!', 'w !sudo tee %', {})

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

-- no delete copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- easy caps
vim.keymap.set('i', '<c-u>', '<ESC>viwUea', { noremap = true })

-- buffer navigation
vim.keymap.set('n', '<leader>bn', '<CMD>bnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bp', '<CMD>bprevious<CR>', { noremap = true })

-- managing tabs
vim.keymap.set('n', '<leader>tn', '<CMD>tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>>', '<CMD>tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader><', '<CMD>tabprevious<CR>', { noremap = true })

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
vim.keymap.set('n', '<leader>qp', '<CMD>previous<CR>', { noremap = true })
vim.keymap.set('n', '<leader>qn', '<CMD>cnext<CR>', { noremap = true })

-- substitution
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>', { noremap = true })
vim.keymap.set('v', '<leader>S', ':s//g<Left><Left>', { noremap = true })
vim.keymap.set('n', '<leader>*', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { noremap = true })

-- spell PROBLEME
vim.keymap.set('n', '<F6>', '<CMD>setlocal spell! spelllang=fr,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<F7>', '<CMD>set spelllang=en,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<M-;>', '<ESC>1z=', { noremap = true })
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


-- Explorer
vim.keymap.set('n', '<leader>e', '<CMD>vert split <BAR> Ex<CR>', { noremap = true })
vim.keymap.set('n', '<leader>x', '<CMD>Ex<CR>', { noremap = true })

-- remember folds
vim.keymap.set('n', '<leader>mkv', '<CMD>mkview<CR>', { noremap = true })

-- terminal
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>vt', '<CMD>vert split <bar> terminal<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vT', '<CMD>split <bar> terminal<CR>', { noremap = true })
