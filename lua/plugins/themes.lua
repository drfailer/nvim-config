function df_clearColors()
    vim.api.nvim_set_hl(0, 'Normal', { bg = None })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = None })
    vim.api.nvim_set_hl(0, 'Float', { bg = None })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = None })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = None })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = None })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = None })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = None })
    vim.api.nvim_set_hl(0, 'Folded', { fg = '#fabd2f', bg = None })
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
        require('lualine').setup {}
    end
end

return {
    "RRethy/base16-nvim",
    dependencies = {
        "nvim-lualine/lualine.nvim"
    },
    lazy = false,
    config = function()
        -- df_setTheme("base16-tomorrow-night", true)
        df_setTheme("base16-gruvbox-dark-hard", true)
        -- df_setTheme("base16-black-metal-gorgoroth")
    end
}
