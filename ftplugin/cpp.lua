--------------------------------------------------------------------------------
--                              code generation                               --
--------------------------------------------------------------------------------

-- note: this could be done in a better way using treesitter
-- generate methodes
-- TODO: implement a way to add it in the cpp file directly

-- yank
local yankClassName = '?^class<CR>w"cyiw'
local yankMethod = '^"myt;'
local yankVar = '"vyiw'
local yankType = '^"tyt '
local cut = 'vipokd'

-- generation
local genMethod = '<C-r>m<Esc>0f(Bi<C-r>c::<Esc>o{<CR>}<Esc>=ip'
local genGetterDec = '<C-r>t get!<C-r>v() const;<Esc>?!<CR>"_xvU'
local genSetterDec = 'void set!<C-r>v(<C-r>t);<Esc>?!<CR>"_xvU'
local genGetterDef = '<C-r>t get!<C-r>v() const { return <C-r>v; }<Esc>?!<CR>"_xvU=='
local genSetterDef = 'void set!<C-r>v(<C-r>t <C-r>v) { this-><C-r>v = <C-r>v; }<Esc>?!<CR>"_xvU=='
local switchToSrc = ':e %:r.cpp<CR>'

-- goto
local insertEnd = 'GO<Esc>O'
local insertPub = '/public:<CR>o'
local st = 'mz'
local gt = '`z'

-- generate methode
vim.keymap.set('n', '<C-m>',
  st .. yankMethod .. yankClassName .. switchToSrc .. insertEnd .. genMethod,
  { noremap = true, buffer = true })
-- getter
vim.keymap.set('n', '<leader>lgg',
  st .. yankVar .. yankType .. insertPub .. genGetterDef .. gt,
  { noremap = true, buffer = true })
-- setter
vim.keymap.set('n', '<leader>lgs',
  st .. yankVar .. yankType .. insertPub .. genSetterDef .. gt,
  { noremap = true, buffer = true })
