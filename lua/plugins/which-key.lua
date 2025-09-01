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
            { "<leader>lF", desc = "format" },
            { "<leader>lg", group = "goto" },
            { "<leader>lgd", desc = "definition (gd)" },
            { "<leader>lgD", desc = "declaration" },
            { "<leader>lgr", desc = "references (gR)" },
            { "<leader>lgi", desc = "implementation" },
            { "<leader>ls", group = "symbols" },
            { "<leader>lsd", desc = "ducument" },
            { "<leader>lsw", desc = "workspace" },
            { "<leader>ld", group = "diagnostic" },
            { "<leader>ldo", desc = "open" },
            { "<leader>ldn", desc = "next" },
            { "<leader>ldp", desc = "previous" },
            { "<leader>lw", group = "workspace actions" },
            { "<leader>lwl", desc = "list folders" },
            { "<leader>lwa", desc = "add folder" },
            { "<leader>lwr", desc = "remove folder" },
            { "<leader>lt", group = "type actions" },
            { "<leader>ltd", group = "definition" },
            { "<leader>lth", group = "hierarchy" },
            { "<leader>lc", group = "calls actions" },
            { "<leader>lci", group = "incoming" },
            { "<leader>lco", group = "outgoing" },

            -- telescope
            { "<leader>ff", group = "telescope" },

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
