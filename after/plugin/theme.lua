--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

-- Gruvbox
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
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

-- onedark
require('onedark').setup {
    style = 'dark'
}

require('NeoSolarized').setup {
  style = "dark",
  transparent = true,
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  enable_italics = true,
  styles = {
    -- Style to be applied to different syntax groups
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    variables = {},
    string = { italic = true },
    underline = true,
    undercurl = true,
  },
  -- Add specific hightlight groups
  on_highlights = function(highlights, colors)
    highlights.ColorColumn.bg = '#073642'
    highlights.CursorLine.bg = '#073642'
  end,
}

-- some settings for themes
local function df_themeSettings()
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { bg = None, fg = '#555555' })
end

-- set the given theme
function df_setTheme(currentTheme)
  if currentTheme == "solarized" then
    vim.cmd.colorscheme('NeoSolarized')
  elseif currentTheme == "gruvbox" then
    vim.cmd.colorscheme('gruvbox')
  elseif currentTheme == "one" then
    vim.cmd.colorscheme('gruvbox')
  end

  df_themeSettings()
end

-- df_setTheme("solarized")
-- df_setTheme("one")
df_setTheme("gruvbox")

-- init lualine
require('lualine').setup()
