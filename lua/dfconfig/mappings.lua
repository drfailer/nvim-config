local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

-- sudo edit
map('c', 'w!!', 'w !sudo tee %')

-- resize
map('n', '<M-j>', '<CMD>resize -2<CR>')
map('n', '<M-k>', '<CMD>resize +2<CR>')
map('n', '<M-h>', '<CMD>vertical resize -2<CR>')
map('n', '<M-l>', '<CMD>vertical resize +2<CR>')

-- escpae
map('i', 'kj', '<Esc>')
map('i', 'kl', '<Esc>la')

-- easy caps
map('i', '<c-u>', '<ESC>viwUea')

-- buffer navigation
map('n', '<leader>nb', '<CMD>bnext<CR>')
map('n', '<leader>bp', '<CMD>bprevious<CR>')

-- managing tabs
map('n', '<leader>tn', '<CMD>tabnew<CR>')
map('n', '<leader>>', '<CMD>tabnext<CR>')
map('n', '<leader><', '<CMD>tabprevious<CR>')

-- indent
map('i', 'vnoremap', '< <gv')
map('i', 'vnoremap', '> >gv')

-- move threw splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- move lines
map('n', '<up> <CMD>move', '-2<cr>')
map('n', '<down> <CMD>move', '+1<cr>')

-- quick fix list
map('n', '<leader>qo', '<CMD>copen<CR>')
map('n', '<leader>qc', '<CMD>cclose<CR>')
map('n', '<C-p>', '<CMD>previous<CR>')
map('n', '<C-n>', '<CMD>cnext<CR>')

-- substitution
map('n', '<leader>S', '<CMD>%s//g<Left><Left>')
map('n', '<leader>S', '<CMD>s//g<Left><Left>')
map('n', '<leader>*', '<CMD>%s/\\<<C-r><C-w>\\>//g<Left><Left>')

-- spell PROBLEME
map('n', '<F6>', '<CMD>setlocal spell! spelllang=fr,cjk<cr>')
map('n', '<F7>', '<CMD>set spelllang=en,cjk<cr>')
map('n', '<M-;>', '<ESC>1z=')
map('n', '<left>', '[s')
map('n', '<right>', ']s')

-- formatoption
map('n', '<leader>/', '<CMD>setlocal formatoptions-=cro<CR>')
map('n', '<leader>#', '<CMD>setlocal formatoptions=cro<CR>')

-- Explorer
map('n', '<leader>e', '<CMD>vert split <BAR> Ex<CR>')
map('n', '<leader>x', '<CMD>Ex<CR>')

-- remember folds
map('n', '<leader>mkv', '<CMD>mkview<CR>')

-- terminal
map('t', '<C-h>', '<C-\\><C-n>')
map('n', '<leader>vt', '<CMD>vert split <bar> <CMD>terminal<CR>')
map('n', '<leader>vtt', '<CMD>split <bar> <CMD>terminal<CR>')

-- fugitive
map('n', '<leader>gj', '<CMD>diffget //3<cr>')
map('n', '<leader>gf', '<CMD>diffget //2<cr>')
map('n', '<leader>gs', '<CMD>G<cr>')
map('n', '<leader>gc', '<CMD>G commit<cr>')
map('n', '<leader>gp', '<CMD>G push<cr>')
