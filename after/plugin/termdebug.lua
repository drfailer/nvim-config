--------------------------------------------------------------------------------
--                                 termdebug                                  --
--------------------------------------------------------------------------------

-- enable termdebug
vim.cmd("packadd termdebug")

vim.g.termdebug_wide = 1

vim.keymap.set('n', '<F8>',       '<CMD>Over<CR>',     { noremap = true })
vim.keymap.set('n', '<F9>',       '<CMD>Step<CR>',     { noremap = true })
vim.keymap.set('n', '<F10>',      '<CMD>Continue<CR>', { noremap = true })
vim.keymap.set('n', '<F11>',      '<CMD>Run<CR>',      { noremap = true })
vim.keymap.set('n', '<F12>',      '<CMD>Stop<CR>',     { noremap = true })
vim.keymap.set('n', '<leader>du', '<CMD>Until<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>db', '<CMD>Break<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>dc', '<CMD>Clear<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>dp', '<CMD>Evaluate<CR>', { noremap = true })
vim.keymap.set('v', '<leader>dp', '<CMD>Evaluate<CR>', { noremap = true })

vim.keymap.set('n', '<leader>dd',
function()
  local exec_name = vim.fn.input('Executable: ', '', 'file')
  vim.cmd("Termdebug " .. exec_name)
end,
{ noremap = true })
