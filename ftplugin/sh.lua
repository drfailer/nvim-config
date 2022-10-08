vim.cmd("compiler shell")

vim.keymap.set('n', '<leader>ce', '<CMD>!chmod +x %<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cl', 'V<CMD>w !bash<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cc', '<CMD>!bash %<CR>', { noremap = true })
vim.keymap.set('v', '<leader>cc', '<CMD>w !bash<CR>', { noremap = true })
