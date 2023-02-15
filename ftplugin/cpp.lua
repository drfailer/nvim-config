-- note: this could be done in a better way using treesitter
-- generate methodes
-- TODO: implement a way to add it in the cpp file directly

-- yank
local yankClassName = '?^class<CR>w"cyiW'
local yankMethod = '^"myt;'
local yankVar = '"vyiw'
local yankType = '^"tyt '

-- generation
local genMethod = '<C-r>m<Esc>0f(Bi<C-r>c::<Esc>o{<CR>}<Esc>=ip'
local genGetterDec = '<C-r>t get!<C-r>v() const;<Esc>?!<CR>"_xvU'
local genSetterDec = 'void set!<C-r>v(<C-r>t);<Esc>?!<CR>"_xvU'
local genGetterDef = '<C-r>t <C-r>c::get!<C-r>v() const<CR>{<CR>return <C-r>v;<CR>}<Esc>?!<CR>"_xvU=ip'
local genSetterDef = 'void <C-r>c::set!<C-r>v(<C-r>t <C-r>v)<CR>{<CR>this-><C-r>v = <C-r>v;<CR>}<Esc>?!<CR>"_xvU=ip'

-- goto
local insertEnd = '/^#endif<CR>O<Esc>O'
local insertPub = '/public:<CR>o'
local st = 'mz'
local gt = '`z'

-- generate methode
vim.keymap.set('n', '<C-m>', st .. yankMethod .. yankClassName .. insertEnd .. genMethod .. gt ,
{noremap = true})
-- getter
vim.keymap.set('n', '<leader>lgg',
st .. yankVar .. yankType .. yankClassName .. insertPub .. genGetterDec .. insertEnd .. genGetterDef .. gt
, {noremap = true})
-- setter
vim.keymap.set('n', '<leader>lgs',
st .. yankVar .. yankType .. yankClassName .. insertPub .. genSetterDec .. insertEnd .. genSetterDef .. gt
, {noremap = true})
