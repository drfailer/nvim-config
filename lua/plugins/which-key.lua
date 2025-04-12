return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            preset = "modern"
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
            { "<leader>lfr", desc = "lsp_references" },
            { "<leader>lfi", desc = "lsp_implementations" },
            { "<leader>lft", desc = "lsp_type_definitions" },
            { "<leader>lfs", desc = "lsp_document_symbols" },
            { "<leader>lfS", desc = "lsp_workspace_symbols" },
            { "<leader>lfd", desc = "diagnostics" },

            -- telescope
            { "<leader>ff", desc = "find_files" },
            { "<leader>fg", desc = "live_grep" },
            { "<leader>fb", desc = "buffers" },
            { "<leader>fh", desc = "help_tags" },
            { "<leader>fk", desc = "keymaps" },
            { "<leader>fS", desc = "spell_suggest" },
            { "<leader>fG", desc = "git_branches" },
            { "<leader>fc", desc = "commands" },
            { "<leader>fC", desc = "command_history" },
            { "<leader>fq", desc = "quickfix" },
            { "<leader>fM", desc = "man_pages" },
            { "<leader>fm", desc = "marks" },
            { "<leader>fj", desc = "jumplist" },

            -- refactor
            { "<leader>r", group = "refactor" },
            { "<leader>rr", desc = "telescope refactor" },
            { "<leader>rp", desc = "refactor debug printf" },
            { "<leader>rdv", desc = "refactor debug print var" },
            { "<leader>rdc", desc = "refactor debug cleanup" },

            -- fugitive
            { "<leader>g", group = "fugitive" },
            { "<leader>gg", desc = "status" },
            { "<leader>gc", desc = "commit" },
            { "<leader>gL", desc = "log" },
            { "<leader>gm", desc = "merge" },
            { "<leader>gd", desc = "resolve conflict" },
            { "<leader>gh", desc = "get diff left" },
            { "<leader>gl", desc = "get diff right" },
            { "<leader>gj", desc = "next diff" },
            { "<leader>gk", desc = "previous diff" },

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
            { "<leader>tv", desc = "virtual edit" },
            { "<leader>tc", desc = "centering" },
            { "<leader>tl", desc = "light / dark background" },
        })
    end
}
