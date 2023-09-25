-- some settings
vim.opt_local.shiftwidth = 2

-- comment header
vim.keymap.set('n', '<leader>FH', 'O%<Escape>78A-<Escape>A%<Escape>yyjpk<CMD>center 80<CR>0r%<CMD>set virtualedit=all<CR>079lr%:set virtualedit=none<CR>', { noremap = true, buffer = true })

-- search threw section
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').grep_string({ search = "section\\{.*\\}", grep_open_files = true, use_regex = true })
end, { noremap = true, buffer = true })

-- compile document
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd("!pdflatex %")
end, { noremap = true, buffer = true })
