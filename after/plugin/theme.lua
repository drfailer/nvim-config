--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

-- Gruvbox
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
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

-- Default options:
require('kanagawa').setup({
    commentStyle = { italic = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = false },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    transparent = true,
    theme = { "default" }
})

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
local function SolarizedTheme()
  vim.g.solarized_termtrans = 1 -- transparent
  vim.g.solarized_italics = 1
  vim.g.solarized_statusline = 'normal'
  vim.cmd('colorscheme solarized-high')
  require('lualine').setup {
    options = { theme  = 'solarized' }
  }
end

local function ModusVivendi()
  vim.g.modus_green_strings = 1
  vim.g.modus_faint_syntax = 1
  vim.g.modus_termtrans_enable = 0
  vim.cmd("colorscheme modus-vivendi")
end

-- vim.cmd("colorscheme onedark")
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme modus-operandi")
-- ModusVivendi()
SolarizedTheme()

-- init lualine
require('lualine').setup()
