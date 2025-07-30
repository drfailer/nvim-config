return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            preset = "classic"
        })

        wk.add({
            -- lsp
            { "<leader>l", group = "lsp" },
            { "<leader>la", desc = "code action" },
            { "<leader>lr", desc = "rename" },
            { "<leader>ln", desc = "next error" },
            { "<leader>lp", desc = "previous error" },
            { "<leader>ld", desc = "diagnostic" },
            { "<leader>ls", desc = "workspace symbol" },
            { "<leader>lR", desc = "references" },
            { "<leader>lF", desc = "buff format" },
            { "<leader>lf", group = "lsp telescope" },

            -- telescope
            { "<leader>ff", group = "telescope" },

            -- refactor
            { "<leader>r", group = "refactor", mode = { "n", "x" }  },
            { "<leader>re", desc = "extract function", mode = { "n", "x" } },
            { "<leader>rf", desc = "extract function to file", mode = { "n", "x" } },
            { "<leader>rv", desc = "extract variable", mode = { "n", "x" } },
            { "<leader>rI", desc = "inline function", mode = { "n", "x" } },
            { "<leader>ri", desc = "inline variable", mode = { "n", "x" } },
            { "<leader>rbb", desc = "extract block", mode = { "n", "x" } },
            { "<leader>rbf", desc = "extract block to file", mode = { "n", "x" } },
            { "<leader>rp", desc = "debug print" },
            { "<leader>rv", desc = "debug print variable", mode = { "n", "x" } },
            { "<leader>rc", desc = "debug print clean" },

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
            { "<leader>q", group = "quickfix list" },
            { "<leader>qo", desc = "open" },
            { "<leader>qc", desc = "close" },

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
