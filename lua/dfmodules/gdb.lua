--------------------------------------------------------------------------------
--                                    GDB                                     --
--------------------------------------------------------------------------------

-- build directory
local build_directory = ''

-- set the build directory
local set_build_dir = function()
  if build_directory == '' then
    build_directory = vim.fn.input('Build directory: ', '', 'file')
    if build_directory == '' then
      build_directory = '.'
    end
  end
end

-- reset the build directory
local reset_build_dir = function()
  build_directory = ''
  set_build_dir()
end

-- set a break point
local add_breakpoint = function()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!echo "break %: ' .. r .. '" >> ' .. build_directory .. '/.gdbinit')
end

-- set a conditional break point
local add_conditional_breakpoint = function()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  condition = vim.fn.input('if: ', '')
  if condition ~= '' then
    vim.cmd('!echo "break %: ' .. r .. ' if ' .. condition .. '" >> ' .. build_directory .. '/.gdbinit')
  end
end

-- set a breakpoint and print the variable (should be used in visual mode)
local print_breakpoints = function()
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

-- clear_breakpoints init file
local clear_breakpoints = function()
  set_build_dir()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd('!rm ' .. build_directory .. '/.gdbinit')
end

return {
	reset_build_dir = reset_build_dir,
	add_breakpoint = add_breakpoint,
	add_conditional_breakpoint = add_conditional_breakpoint,
	print_breakpoints = print_breakpoints,
	clear_breakpoints = clear_breakpoints,
}
