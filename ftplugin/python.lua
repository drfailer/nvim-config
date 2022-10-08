vim.keymap.set('n', '<leader>cc', '<CMD>!python3 %<CR>', { noremap = true })
vim.keymap.set('v', '<leader>cc', ':w !python3<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cl', 'V:w !python3<CR>', { noremap = true })
