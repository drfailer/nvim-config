--------------------------------------------------------------------------------
--                                   abrev                                    --
--------------------------------------------------------------------------------

-- vim.cmd("ab todo TODO(RC):")
-- vim.cmd("ab note NOTE(RC):")
-- vim.cmd("ab warn WARNNING(RC):")
-- vim.cmd("ab q? QUESTION(RC):")

--------------------------------------------------------------------------------
--                                  mappings                                  --
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>FF', ':%!clang-format --style=Mozilla<cr>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>FT', 'I/*{ <Esc>A }<Esc>:set virtualedit=all<CR>079lr/hr*hr{hr{hr{hvT}r*:set virtualedit=none<CR>o/<Esc>78a*<Esc>A/<Esc>hhr}hr}hr}', { noremap = true, buffer = true })

-- generate header automatically
vim.keymap.set('n', '<leader>FH', 'O<Escape>80i*<Escape>0r/$r/yyjpk<CMD>center 80<CR>0r/lr*<CMD>set virtualedit=all<CR>078lr*lr/:set virtualedit=none<CR>', { noremap = true, buffer = true })

-- clangd switch between c and h file
vim.keymap.set('n', '<C-f>', ':ClangdSwitchSourceHeader<CR>', { noremap = true, buffer = true })

-- build directory
local build_directory = ''
function set_build_directory()
  if build_directory == '' then -- NOTE: we use the build directory as it contains a .gdbinit
    build_directory = vim.fn.input('Build directory: ', '', 'file')
    if build_directory == '' then
      build_directory = '.'
    end
  end
end

-- invoke make
vim.keymap.set('n', '<leader>cc',
function()
  set_build_directory()
  vim.cmd('make -C ' .. build_directory)
end,
{ noremap = true, buffer = true })

--------------------------------------------------------------------------------
--                                    gdb                                     --
--------------------------------------------------------------------------------

-- gdbutilities

-- reset build directory
vim.keymap.set('n', '<leader>dd',
function()
  build_directory = ''
  set_build_directory()
end,
{ noremap = true, buffer = true })

-- place a breakpoint in the .gdbinit file (it's sourced automatically when
-- entering a new debugging session)
vim.keymap.set('n', '<leader>db',
function()
  set_build_directory()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!echo "break %: ' .. r .. '" >> ' .. build_directory .. '/.gdbinit')
end,
{ noremap = true, buffer = true })

-- conditional breakpoint
vim.keymap.set('n', '<leader>dc',
function()
  set_build_directory()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  condition = vim.fn.input('if: ', '', 'file')
  if condition ~= '' then
    vim.cmd('!echo "break %: ' .. r .. ' if ' .. condition .. '" >> ' .. build_directory .. '/.gdbinit')
  end
end,
{ noremap = true, buffer = true })

-- clear breakpoint (juste remote the .gdbinit file in the build directory)
vim.keymap.set('n', '<leader>dC',
function()
  set_build_directory()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!rm ' .. build_directory .. '/.gdbinit')
end,
{ noremap = true, buffer = true })

-- place a break at the current and attatch a command to it to print the
-- highlighted value
vim.keymap.set('v', '<leader>dp',
function()
  vim.cmd('normal "vy')
  set_build_directory()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  local initfile = build_directory .. '/.gdbinit'
  local value = vim.api.nvim_exec("echo getreg('v')", true):gsub("[\n\r]", "^J") -- it works...
  vim.cmd('!echo "break %: ' .. r .. '" >> ' .. initfile) -- place a breakpoint
  vim.cmd('!echo "command $(grep -c break ' .. initfile .. ')" >> ' .. initfile) -- command on last breakpoint
  vim.cmd('!echo "print ' .. value .. '" >> ' .. initfile) -- print the yanked text
  -- vim.cmd('!echo "continue" >> ' .. initfile) -- continue
  vim.cmd('!echo "end" >> ' .. initfile) -- end command
end,
{ noremap = true, buffer = true })
