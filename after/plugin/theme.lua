--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

function df_clearColors()
  vim.api.nvim_set_hl(0, 'Normal', { bg = None })
  vim.api.nvim_set_hl(0, 'Float', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = None })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { bg = None, fg = '#555555' })
end

-- set the given theme
function df_setTheme(currentTheme)
  if currentTheme == "melange" then
    vim.cmd.colorscheme("melange")
    df_clearColors()
  else
    vim.cmd.colorscheme(currentTheme)
  end
end

-- df_setTheme("melange")
df_setTheme("base16-tomorrow-night")

-- init lualine
require('lualine').setup()
