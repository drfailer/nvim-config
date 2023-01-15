-- note: this could be done in a better way using treesitter
-- methode generation
vim.keymap.set('n', '<leader>lgm', 'mzB"myt(f("pyi(?class<CR>w"cyiw/{<CR>%o<C-r>c::<C-r>m(<C-r>p)<Escape>o{}<Escape>`z', {noremap = true})
