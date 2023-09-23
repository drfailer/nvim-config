--------------------------------------------------------------------------------
--                                  mappings                                  --
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>cc', '<CMD>!pandoc -V geometry:margin=1in % -o %:r.pdf &<CR>', { noremap = true, buffer = true})
vim.keymap.set('n', '<leader>cx', '0f[lrx', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>cu', '0f[lr ', { noremap = true, buffer = true })

-- search threw section
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').grep_string({ search = "^#", grep_open_files = true, use_regex = true })
end, {})

-- format text
vim.keymap.set('v', '<leader>mb', 'c**<C-r>"**<Esc>', { noremap = true, buffer = true})
vim.keymap.set('v', '<leader>mi', 'c*<C-r>"*<Esc>', { noremap = true, buffer = true})
vim.keymap.set('v', '<leader>ml', 'c[<C-r>"](<C-r>")<Esc>0f(i<CR><Esc>V:s/ /-/g<CR>0f)i.md<Esc>kgJ', { noremap = true, buffer = true})

-- vim.cmd("TSDisable highlight") -- disable doesn't work in Treesitter config
