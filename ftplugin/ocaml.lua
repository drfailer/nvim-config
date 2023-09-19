-- format
vim.keymap.set('n', '<leader>FF', '!dune fmt<CR>', { noremap = true, buffer = true })

-- banner
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i*<Escape>0r($r)yyjpk<CMD>center 80<CR>0r(lr*<CMD>set virtualedit=all<CR>078lr*lr):set virtualedit=none<CR>', { noremap = true, buffer = true })
