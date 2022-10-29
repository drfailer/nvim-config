--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

-- vscode theme
-- local c = require('vscode.colors')
-- require('vscode').setup({
--     -- Enable transparent background
--     transparent = true,

--     -- Enable italic comment
--     italic_comments = true,

--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,

--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },

--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })

-- -- Gruvbox
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.g.gruvbox_sign_column = "bg0"
-- vim.g.gruvbox_improved_warnings = 1

-- onedark
require('onedark').setup {
    style = 'darker'
}

-- rose-pine
require('rose-pine').setup({
	dark_variant = 'main', -- main moon
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

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

-- tokyodark
-- init.lua
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"

-- require('onedark').load()
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd('colorscheme rose-pine')
vim.cmd("colorscheme tokyodark")
