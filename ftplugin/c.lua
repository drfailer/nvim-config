vim.keymap.set('n', '<leader>FF', ':%!clang-format --style=Mozilla<cr>', {
  noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cc', '<CMD>make<CR>', { noremap = true, buffer = true})

-- generate header automatically
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i*<Escape>0r/$r/yyjpk<CMD>center 80<CR>0r/lr*<CMD>set virtualedit=all<CR>078lr*lr/:set virtualedit=none<CR>', { noremap = true, buffer = true })
