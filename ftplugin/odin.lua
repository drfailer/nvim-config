--------------------------------------------------------------------------------
--                                    odin                                    --
--------------------------------------------------------------------------------

-- build
vim.keymap.set('n', '<leader>cc', '<CMD>make<CR>', { noremap = true, buffer = true})

-- headers
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i*<Escape>0r/$r/yyjpk<CMD>center 80<CR>0r/lr*<CMD>set virtualedit=all<CR>078lr*lr/:set virtualedit=none<CR>', { noremap = true, buffer = true })

-- search
vim.keymap.set("n", "gd", ":vimgrep <C-r><C-w>\\s*: **/*.odin<CR>", { noremap = true, buffer = true })

vim.cmd("compiler odin")
