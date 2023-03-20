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
-- require('onedark').setup {
--     style = 'dark'
-- }

-- rose-pine
local myBgColor = '#000000'
require('rose-pine').setup({
  -- main or moon
	dark_variant = 'main',
  disable_background = true,
	groups = {
		-- background = 'base',
		background = myBgColor,
		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},
  -- highlight_groups = {
  --   TelescopeNormal = { bg = myBgColor },
  --   TelescopeBorder = { bg = myBgColor },
  --   NormalFloat = { bg = myBgColor },
  --   FloatBorder = { bg = myBgColor },
  -- }
})

-- solarized config
local function df_solarized()
  vim.g.solarized_termtrans = 1 -- transparent
  vim.g.solarized_italics = 1
  vim.g.solarized_statusline = 'normal'
  vim.cmd('colorscheme solarized-high')
  -- vim.cmd('colorscheme solarized')
  require('lualine').setup {
    options = { theme  = 'solarized' }
  }
end

-- modus vivendi config
local function df_modusVivendi()
  vim.g.modus_green_strings = 1
  vim.g.modus_faint_syntax = 1
  vim.g.modus_termtrans_enable = 0
  vim.cmd("colorscheme modus-vivendi")
end

-- some settings for themes
local function df_themeSettings()
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
end

-- set the given theme
function df_setTheme(currentTheme)
  if currentTheme == "solarized" then
    df_solarized()
  elseif currentTheme == "gruvbox" then
    vim.cmd("colorscheme gruvbox")
  elseif currentTheme == "rose-pine" then
    vim.cmd('colorscheme rose-pine')
  elseif currentTheme == "modus-vivendi" then
    df_modusVivendi()
  elseif currentTheme == "modus-operandi" then
    vim.cmd("colorscheme modus-operandi")
  end

  df_themeSettings()
end

-- df_setTheme("solarized")
df_setTheme("rose-pine")

-- init lualine
require('lualine').setup()
