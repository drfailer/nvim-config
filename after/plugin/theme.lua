--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

-- gruvbox
local function df_gruvbox()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.cmd.colorscheme('gruvbox')
end

-- everforest theme
local function df_everforest()
  vim.g.everforest_background = 'hard'
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_disable_italic_comment = 1
  vim.g.everforest_transparent_background = 1
  vim.g.everforest_dim_inactive_windows = 0
  vim.g.everforest_sign_column_background = 'none'
  vim.g.everforest_spell_foreground = 'colored'
  vim.g.everforest_diagnostic_text_highlight = 1
  vim.g.everforest_diagnostic_virtual_text = 'colored'
  vim.cmd.colorscheme('everforest')
  vim.api.nvim_set_hl(0, 'Visual', { bg = "#5d6b66" }) -- the default color is not visible enough for me
end

-- some settings for themes
function df_themeSettings()
  vim.api.nvim_set_hl(0, 'Normal', { bg = None })
  vim.api.nvim_set_hl(0, 'Float', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { bg = None, fg = '#555555' })
end

-- set the given theme
function df_setTheme(currentTheme)
  if currentTheme == "gruvbox" then
    df_gruvbox()
  elseif currentTheme == "everforest" then
    df_everforest()
  elseif currentTheme == "melange" then
    vim.cmd.colorscheme("melange")
  end

  df_themeSettings()
end

-- df_setTheme("everforest")
df_setTheme("melange")
-- df_setTheme("gruvbox")

-- init lualine
require('lualine').setup()
