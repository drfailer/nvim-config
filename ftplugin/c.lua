vim.keymap.set('n', '<leader>FF', ':%!clang-format --style=Mozilla<cr>', {
  noremap = true, buffer = true })
vim.keymap.set('n', '<leader>FT', 'I/*{ <Esc>A }<Esc>:set virtualedit=all<CR>079lr/hr*hr{hr{hr{hvT}r*:set virtualedit=none<CR>o/<Esc>78a*<Esc>A/<Esc>hhr}hr}hr}', {
  noremap = true, buffer = true })

-- invoke make
local build_directory = ''
vim.keymap.set('n', '<leader>cc',
function()
  if build_directory == '' then
    build_directory = vim.fn.input('Build directory: ', '', 'file');
    if build_directory == '' then
      build_directory = '.'
    end
  end
  vim.cmd('make -C ' .. build_directory);
end,
{ noremap = true, buffer = true });

-- generate header automatically
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i*<Escape>0r/$r/yyjpk<CMD>center 80<CR>0r/lr*<CMD>set virtualedit=all<CR>078lr*lr/:set virtualedit=none<CR>', { noremap = true, buffer = true })
