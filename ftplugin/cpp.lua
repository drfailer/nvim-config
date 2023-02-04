-- note: this could be done in a better way using treesitter
-- generate methodes
-- TODO: implement a way to add it in the cpp file directly
vim.keymap.set('n', '<C-m>', 'mz^"myt;?^class<CR>w"cyiw/{<CR>%o<CR><C-r>m<Esc>0f(Bi<C-r>c::<Esc>o{<CR>}<Esc>=ip`zj', {noremap = true})
