return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            preset = "classic"
        })

        wk.add({
            -- buffers
            { "<leader>b", group = "buffers" },
            { "<leader>bn", desc = "next" },
            { "<leader>bp", desc = "prev" },
            { "<leader>bk", desc = "delete" },

            -- telescope
            { "<leader>f", group = "telescope" },

            -- fugitive
            { "<leader>g", group = "fugitive" },

            -- gdb
            { "<leader>d", group = "gdb" },
            { "<leader>dd", desc = "reset build directory" },
            { "<leader>db", desc = "set breakpoint" },
            { "<leader>dc", desc = "set conditional breakpoint" },
            { "<leader>dp", desc = "set print breakpoint", mode = 'v' },
            { "<leader>dC", desc = "clear" },

            -- quickfix list
            { "<C-q>", group = "quickfix list" },
            { "<C-q><C-o>", desc = "open" },
            { "<C-q><C-q>", desc = "close" },
            { "<C-q><C-n>", desc = "cnext" },
            { "<C-q><C-p>", desc = "cprev" },

            -- toggle
            { "<leader>t", group = "toggle options" },
            { "<leader>tt", desc = "terminal" },
            { "<leader>tv", desc = "virtual edit" },
            { "<leader>tc", desc = "centering" },
            { "<leader>tl", desc = "light / dark background" },

            -- utils
            { "<leader>!", desc = "terminal" },
            { "<leader>R", desc = "rename file" },
        })
    end
}
