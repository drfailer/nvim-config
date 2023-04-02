--------------------------------------------------------------------------------
--                                  fugitive                                  --
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>gs', '<CMD>G<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gc', '<CMD>G commit<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gp', '<CMD>G push<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gL', '<CMD>G log<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gm', ':G merge ', { noremap = true })
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit!<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gh', '<CMD>diffget //2<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gl', '<CMD>diffget //3<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gj', ']c', { noremap = true })
vim.keymap.set('n', '<leader>gk', '[c', { noremap = true })
