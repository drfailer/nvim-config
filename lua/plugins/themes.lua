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
  vim.api.nvim_set_hl(0, 'Folded', { fg = '#a0a0a0', bg = None })
  vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
  -- completion menu
  for _, group in ipairs({'Pmenu', 'PmenuKind', 'PmenuExtra'}) do
      vim.api.nvim_set_hl(0, group, { bg = '#101010' })
  end
  for _, group in ipairs({'PmenuSel', 'PmenuKindSel', 'PmenuExtraSel'}) do
      vim.api.nvim_set_hl(0, group, { bg = '#1a1a1a' })
  end
  vim.api.nvim_set_hl(0, 'PmenuMatch', { fg = '#e8b589' })
  vim.api.nvim_set_hl(0, 'PmenuMatchSel', { fg = '#e8b589' })
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
  -- "rose-pine/neovim",
  "vague-theme/vague.nvim",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  },
  lazy = false,
  config = function()
    -- setup_rose_pine()
    -- df_setTheme("rose-pine", false)
    df_setTheme("vague", true)
  end
}
