--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

function df_clearColors()
  vim.api.nvim_set_hl(0, 'Normal', { bg = None })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = None })
  vim.api.nvim_set_hl(0, 'Float', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = None })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { fg = '#fabd2f', bg = None })
end

-- set the given theme
function df_setTheme(currentTheme)
  vim.cmd.colorscheme(currentTheme)
  df_clearColors()
end

-- df_setTheme("melange")
-- df_setTheme("base16-tomorrow-night")
df_setTheme("base16-gruvbox-dark-hard")
-- df_setTheme("base16-black-metal-bathory")

-- init lualine
local lualine_gruvbox = require('lualine.themes.gruvbox')
lualine_gruvbox.normal.c.bg = '#282828'
lualine_gruvbox.inactive.c.bg = '#282828'
require('lualine').setup {
  options = { theme  = lualine_gruvbox },
}
