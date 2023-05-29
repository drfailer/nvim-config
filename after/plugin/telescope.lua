-------------------------------------------------------------------------------
--                                 TELESCOPE:                                --
-------------------------------------------------------------------------------
local builtin = require('telescope.builtin')

-- mappings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fS', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>fG', builtin.git_branches, {})

-- lsp
vim.keymap.set('n', '<leader>lfr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>lfs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lfd', builtin.diagnostics, {})
