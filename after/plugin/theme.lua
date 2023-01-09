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
require('onedark').setup {
    style = 'dark'
}

-- rose-pine
require('rose-pine').setup({
  -- main or moon
	dark_variant = 'moon',
	groups = {
		background = 'base',
		-- background = '#000000',
		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')

-- vim.cmd("colorscheme onedark")
-- vim.cmd('colorscheme rose-pine')
vim.cmd("colorscheme gruvbox")


-- init lualine
require('lualine').setup()
