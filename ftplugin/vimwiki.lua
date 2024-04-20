vim.keymap.set('n', '<leader>co', '<CMD>!pandoc -V geometry:margin=1in % -o %:r.pdf; zathura %:r.pdf &<CR>', { noremap = true, buffer = true})
