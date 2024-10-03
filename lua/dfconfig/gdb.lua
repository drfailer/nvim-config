--------------------------------------------------------------------------------
--                                    GDB                                     --
--------------------------------------------------------------------------------

-- build directory
local build_directory = ''

-- set the build directory
function set_build_dir()
  if build_directory == '' then
    build_directory = vim.fn.input('Build directory: ', '', 'file')
    if build_directory == '' then
      build_directory = '.'
    end
  end
end

-- reset the build directory
function reset_build_dir()
  build_directory = ''
  set_build_dir()
end

-- set a break point
function gdb_break()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!echo "break %: ' .. r .. '" >> ' .. build_directory .. '/.gdbinit')
end

-- set a conditional break point
function gdb_cbreak()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  condition = vim.fn.input('if: ', '', 'file')
  if condition ~= '' then
    vim.cmd('!echo "break %: ' .. r .. ' if ' .. condition .. '" >> ' .. build_directory .. '/.gdbinit')
  end
end

-- set a breakpoint and print the variable (should be used in visual mode)
function gdb_print_break()
  vim.cmd('normal "vy')
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  local initfile = build_directory .. '/.gdbinit'
  local value = vim.api.nvim_exec("echo getreg('v')", true):gsub("[\n\r]", "^J") -- it works...
  vim.cmd('!echo "break %: ' .. r .. '" >> ' .. initfile) -- place a breakpoint
  vim.cmd('!echo "command $(grep -c break ' .. initfile .. ')" >> ' .. initfile) -- command on last breakpoint
  vim.cmd('!echo "print ' .. value .. '" >> ' .. initfile) -- print the yanked text
  vim.cmd('!echo "end" >> ' .. initfile) -- end command
end

-- gdb_clear init file
function gdb_clear()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!rm ' .. build_directory .. '/.gdbinit')
end

-- mappings
vim.keymap.set('n', '<leader>dd', reset_build_dir, { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>db', gdb_break, { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>dc', gdb_cbreak, { noremap = true, buffer = true })
vim.keymap.set('v', '<leader>dp', gdb_print_break, { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>dC', gdb_clear, { noremap = true, buffer = true })
