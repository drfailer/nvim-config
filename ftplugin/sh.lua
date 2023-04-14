vim.cmd("compiler shell")

vim.keymap.set('n', '<leader>ce', '<CMD>!chmod +x %<CR>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cl', 'V:w !bash<CR>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cc', '<CMD>!bash %<CR>', { noremap = true, buffer = true})
vim.keymap.set('v', '<leader>cc', ':w !bash<CR>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i#<Escape>yyjpk<CMD>center 80<CR>0r#<CMD>set virtualedit=all<CR>079lr#:set virtualedit=none<CR>', { noremap = true, buffer = true })
