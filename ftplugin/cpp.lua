-- note: this could be done in a better way using treesitter
-- generate methodes
-- TODO: implement a way to add it in the cpp file directly

-- yank
local yankClassName = '?^class<CR>w"cyiw'
local yankMethod = '^"myt;'
local yankVar = '"vyiw'
local yankType = '^"tyt '

-- generation
local genMethod = '<C-r>m<Esc>0f(Bi<C-r>c::<Esc>o{<CR>}<Esc>=ip'
local genGetterDec = '<C-r>t get!<C-r>v() const;<Esc>?!<CR>"_xvU'
local genSetterDec = 'void set!<C-r>v(<C-r>t);<Esc>?!<CR>"_xvU'
local genGetterDef = '<C-r>t get!<C-r>v() const { return <C-r>v; }<Esc>?!<CR>"_xvU=ip'
local genSetterDef = 'void set!<C-r>v(<C-r>t <C-r>v) { this-><C-r>v = <C-r>v; }<Esc>?!<CR>"_xvU=ip'

-- goto
local insertEnd = '/^#endif<CR>O<Esc>O'
local insertPub = '/public:<CR>o'
local st = 'mz'
local gt = '`z'

-- generate methode
vim.keymap.set('n', '<C-m>', st .. yankMethod .. yankClassName .. insertEnd .. genMethod .. gt ,
{ noremap = true, buffer = true })
-- getter
vim.keymap.set('n', '<leader>lgg',
st .. yankVar .. yankType .. insertPub .. genGetterDef .. gt
, { noremap = true, buffer = true })
-- setter
vim.keymap.set('n', '<leader>lgs',
st .. yankVar .. yankType .. insertPub .. genSetterDef .. gt
, { noremap = true, buffer = true })

-- clang-format
vim.keymap.set('n', '<leader>FF', ':%!clang-format --style=Mozilla<cr>', { noremap = true, buffer = true  })

-- invoke make
local build_directory = ''
vim.keymap.set('n', '<leader>cc',
function()
  if build_directory == '' then
    build_directory = vim.fn.input('Build directory: ', '', 'file');
  else
    vim.cmd('make -C ' .. build_directory);
  end
end);
