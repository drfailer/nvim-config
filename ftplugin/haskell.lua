vim.keymap.set('n', '<leader>F', ':%!hindent<cr>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cc', '<CMD>!runghc %<CR>', { noremap = true, buffer = true})
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i-<Escape>yyjpk<CMD>center 80<CR>0r-lr-<CMD>set virtualedit=all<CR>078lr-lr-:set virtualedit=none<CR>', { noremap = true, buffer = true })
