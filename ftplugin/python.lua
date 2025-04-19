vim.keymap.set('n', '<leader>cc', '<CMD>!python3 %<CR>', { noremap = true, buffer = true })
vim.keymap.set('v', '<leader>cc', ':w !python3<CR>', { noremap = true, buffer = true})
vim.keymap.set('n', '<leader>cl', 'V:w !python3<CR>', { noremap = true, buffer = true})
vim.keymap.set('n', '<leader>FH', 'O<Escape>79i#<Escape>yyjpk<CMD>center 79<CR>0r#<CMD>set virtualedit=all<CR>079lr#:set virtualedit=none<CR>', { noremap = true, buffer = true })

vim.keymap.set('n', '<leader>cC', function()
    require("dfconfig.terminal").toggle_bottom_terminal("python3 " .. vim.fn.expand("%"))
end, { noremap = true, buffer = true })
