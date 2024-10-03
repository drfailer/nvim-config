--------------------------------------------------------------------------------
--                              code generation                               --
--------------------------------------------------------------------------------

-- note: this could be done in a better way using treesitter
-- generate methodes
-- TODO: implement a way to add it in the cpp file directly

-- yank
local yankClassName = '?^class<CR>w"cyiw'
local yankMethod = '$F)v^"my'
local yankVar = '"vyiw'
local yankType = '^v/[=;]<CR>b?[a-zA-Z0-9>\\*]<CR>"ty'
local cut = 'vipokd'

-- generation
local genMethod = '<C-r>m<Esc>0f(Bi<C-r>c::<Esc>A {<CR>}<Esc>=ip'
local genGetterDec = '<C-r>t get!<C-r>v() const;<Esc>?!<CR>"_xvU'
local genSetterDec = 'void set!<C-r>v(<C-r>t);<Esc>?!<CR>"_xvU'
local genGetterDef = '<C-r>t get!<C-r>v() const { return <C-r>v; }<Esc>?!<CR>"_xvU=='
local genSetterDef = 'void set!<C-r>v(<C-r>t <C-r>v) { this-><C-r>v = <C-r>v; }<Esc>?!<CR>"_xvU=='
local genGetterDef_ = '<C-r>t <C-r>v() const { return <C-r>v; }<Esc>^/_(<CR>"_x'
local genSetterDef_ = 'void <C-r>v(<C-r>t <C-r>v) { this-><C-r>v = <C-r>v; }<Esc>^/_(<CR>"_x/_)<CR>"_x/_;<CR>"_x'
local switchToSrc = ':e %:r.cpp<CR>'

-- goto
local insertEnd = 'GO<Esc>O'
local insertPub = '/public:<CR>}O'
local st = 'mz'
local gt = '`z'

-- full commands
local generate_getter = st .. yankVar .. yankType .. insertPub .. genGetterDef_ .. gt
local generate_setter = st .. yankVar .. yankType .. insertPub .. genSetterDef_ .. gt
local generate_method = st .. yankMethod .. yankClassName .. switchToSrc .. insertEnd .. genMethod

-- mappings
vim.keymap.set('n', '<C-m>', generate_method, { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>lgg', generate_setter, { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>lgs', generate_setter, { noremap = true, buffer = true })
