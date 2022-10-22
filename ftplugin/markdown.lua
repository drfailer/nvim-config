vim.keymap.set('n', '<leader>cc', '<CMD>!pandoc % -o %:r.pdf &<CR>', { noremap = true })

vim.cmd("TSDisable highlight") -- disable doesn't work in Treesitter config
