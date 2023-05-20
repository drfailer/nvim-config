--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

-- Gruvbox
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    comments = true
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  -- overrides = {
  --   SignColumn = {bg = "#1d2021"}
  -- },
  dim_inactive = false,
  transparent_mode = true,
})

-- solarized config
local function df_solarized()
  vim.g.solarized_termtrans = 1 -- transparent
  vim.g.solarized_italics = 1
  vim.g.solarized_statusline = 'normal'
  vim.cmd.colorscheme('solarized')
  require('lualine').setup {
    options = { theme  = 'solarized' }
  }
end

-- modus vivendi config
local function df_modus(light)
  vim.g.modus_faint_syntax = 0
  vim.g.modus_green_strings = 1
  vim.g.modus_termtrans_enable = 1
  vim.g.modus_dim_inactive_window = 0
  if light then
    vim.cmd.colorscheme('modus-operandi')
  else
    vim.cmd.colorscheme('modus-vivendi')
  end
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
  vim.g.everforest_spell_foreground = 'colored'
  vim.g.everforest_diagnostic_text_highlight = 1
  vim.g.everforest_diagnostic_virtual_text = 'colored'
  vim.cmd.colorscheme('everforest')
end

-- some settings for themes
local function df_themeSettings()
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { bg = None, fg = '#555555' })
end

-- set the given theme
function df_setTheme(currentTheme)
  if currentTheme == "solarized" then
    df_solarized()
  elseif currentTheme == "gruvbox" then
    vim.cmd.colorscheme('gruvbox')
  elseif currentTheme == "everforest" then
    df_everforest()
  elseif currentTheme == "vivendi" then
    df_modus(false)
  elseif currentTheme == "operandi" then
    df_modus(true)
  end

  df_themeSettings()
end

-- df_setTheme("solarized")
-- df_setTheme("vivendi")
-- df_setTheme("operandi")
df_setTheme("everforest")
-- df_setTheme("gruvbox")

-- init lualine
require('lualine').setup()
