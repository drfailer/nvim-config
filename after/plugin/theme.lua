--------------------------------------------------------------------------------
--                                   THEME                                    --
--------------------------------------------------------------------------------

require('kanagawa').setup({
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    keywordStyle = { italic = false },
    statementStyle = { bold = false },
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptBorder = { fg = theme.ui.fg_p1, bg = "none" },
            TelescopeResultsBorder = { fg = theme.ui.fg_p1, bg = "none" },
            TelescopePreviewBorder = { fg = theme.ui.fg_p1, bg = "none" },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
    theme = "dragon",
    background = { dark = "dragon", },
})

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
  elseif currentTheme == "onedark" then
    vim.cmd.colorscheme("onedark")
  elseif currentTheme == "dragon" then
    vim.cmd.colorscheme("kanagawa-dragon")
  elseif currentTheme == "kanagawa" then
    vim.cmd.colorscheme("kanagawa")
  end

  df_themeSettings()
end

-- df_setTheme("everforest")
-- df_setTheme("melange")
-- df_setTheme("dragon")
-- df_setTheme("kanagawa")
df_setTheme("onedark")
-- df_setTheme("gruvbox")

-- init lualine
require('lualine').setup()
