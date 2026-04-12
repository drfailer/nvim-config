vim.pack.add({"https://github.com/vague-theme/vague.nvim.git"})

function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function df_clearColors()
    hl('Normal', { bg = None })
    hl('NormalNC', { bg = None })
    hl('NormalFloat', { bg = None })
    hl('Float', { bg = None })
    hl('LineNr', { bg = None })
    hl('LineNrAbove', { bg = None })
    hl('LineNrBelow', { bg = None })
    hl('CursorLineNr', { bg = None })
    hl('SignColumn', { bg = None })
    hl('Folded', { fg = '#a0a0a0', bg = None })
    hl('FloatBorder', { link = 'Normal' })
    -- completion menu
    for _, group in ipairs({'Pmenu', 'PmenuKind', 'PmenuExtra'}) do
        hl(group, { bg = '#101010' })
    end
    for _, group in ipairs({'PmenuSel', 'PmenuKindSel', 'PmenuExtraSel'}) do
        hl(group, { bg = '#1a1a1a' })
    end
    hl('PmenuMatch', { fg = '#e8b589' })
    hl('PmenuMatchSel', { fg = '#e8b589' })
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

df_setTheme("vague", true)
