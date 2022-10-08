vim.keymap.set('n', '<leader>F', ':%!clang-format --style=Mozilla<cr>', {
  noremap = true })
vim.keymap.set('n', '<leader>cc', '<CMD>make<CR>', {noremap = true})
