--------------------------------------------------------------------------------
--                                 termdebug                                  --
--------------------------------------------------------------------------------

-- enable termdebug
vim.cmd("packadd termdebug")

vim.g.termdebug_wide = 1

vim.keymap.set('n', '<F8>',       ':Over<CR>',     { noremap = true })
vim.keymap.set('n', '<F9>',       ':Step<CR>',     { noremap = true })
vim.keymap.set('n', '<F10>',      ':Continue<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dr', ':Run<CR>',      { noremap = true })
vim.keymap.set('n', '<leader>ds', ':Stop<CR>',     { noremap = true })
vim.keymap.set('n', '<leader>du', ':Until<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>db', ':Break<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>dc', ':Clear<CR>',    { noremap = true })
vim.keymap.set('n', '<leader>dp', ':Evaluate<CR>', { noremap = true })
vim.keymap.set('v', '<leader>dp', ':Evaluate<CR>', { noremap = true })

vim.keymap.set('n', '<leader>dd',
function()
  local exec_name = vim.fn.input('Executable: ', '', 'file')
  vim.cmd("Termdebug " .. exec_name)
end,
{ noremap = true })
