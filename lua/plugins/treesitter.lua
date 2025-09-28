return {
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
        -- return vim.fn.executable('gcc') or vim.fn.executable('clang')
        return not (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "lua", "rust" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            ignore_install = { "latex", "tex" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
