function df_clearColors()
  vim.api.nvim_set_hl(0, 'Normal', { bg = None })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = None })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = None })
  vim.api.nvim_set_hl(0, 'Float', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = None })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = None })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = None })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
  vim.api.nvim_set_hl(0, 'Folded', { fg = '#fabd2f', bg = None })
  vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
end

-- set the given theme
function df_setTheme(currentTheme, custom_config)
  vim.cmd.colorscheme(currentTheme)
  if custom_config then
    df_clearColors()
  end
  if string.find(currentTheme, "gruvbox") then
    local lualine_gruvbox = require('lualine.themes.gruvbox')
    lualine_gruvbox.normal.c.bg = '#282828'
    lualine_gruvbox.inactive.c.bg = '#282828'
    require('lualine').setup {
      options = { theme  = lualine_gruvbox },
    }
  else
    require('dfconfig.statusline')
  end
end

function setup_base16()
  require("base16-colorscheme").with_config({
    telescope = false,
    cmp = false,
  })
end

function setup_rose_pine()
  require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = false,

    styles = {
      bold = false,
      italic = false,
      transparency = true,
    },
  })
end

return {
  "RRethy/base16-nvim",
  dependencies = {
    "nvim-lualine/lualine.nvim",
    "rose-pine/neovim",
  },
  lazy = false,
  config = function()
    setup_base16()
    setup_rose_pine()
    -- df_setTheme("base16-tomorrow-night", true)
    -- df_setTheme("base16-gruvbox-dark-hard", true)
    -- df_setTheme("base16-rose-pine", true)
    df_setTheme("rose-pine", false)
  end
}
