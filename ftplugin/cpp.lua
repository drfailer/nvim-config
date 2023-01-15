-- note: this could be done in a better way using treesitter
-- methode generation (note: record a macro)
vim.keymap.set('n', '<C-m>', 'mzB"myt(f("pyi(?class<CR>w"cyiw/{<CR>%o<C-r>c::<C-r>m(<C-r>p)<Escape>o{}<Escape>`zj^w', {noremap = true})
