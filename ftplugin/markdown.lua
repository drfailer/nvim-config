vim.keymap.set('n', '<leader>cc', '<CMD>!pandoc -V geometry:margin=1in % -o %:r.pdf &<CR>', { noremap = true, buffer = true})
vim.keymap.set('n', '<leader>cx', '0f[lrx', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cu', '0f[lr ', { noremap = true, buffer = true })

-- vim.cmd("TSDisable highlight") -- disable doesn't work in Treesitter config
