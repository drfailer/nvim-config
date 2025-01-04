--------------------------------------------------------------------------------
--                                   viwiki                                   --
--------------------------------------------------------------------------------

vim.g.vimwiki_list = {
  {
    path = '~/Documents/wiki/',
    syntax = 'markdown',
    ext = '.md',
    nested_syntaxes = {
      python = 'python',
      cpp = 'cpp',
      c = 'c',
      haskell = 'haskell',
      rust = 'rust',
      sh = 'sh',
      bash = 'sh',
      cmake = 'cmake',
    }
  }
}

vim.keymap.set('n', '<leader>co', '<CMD>!pandoc -V geometry:margin=1in % -o %:r.pdf; zathura %:r.pdf &<CR>', { noremap = true, buffer = true})

-- markdown headers colors
-- vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = "#b8bb26", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = "#fabd2f", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = "#d3869b", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader4', { fg = "#fb4934", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader5', { fg = "#8ec07c", bold = true })
-- vim.api.nvim_set_hl(0, 'VimwikiHeader6', { fg = "#fe8819", bold = true })
