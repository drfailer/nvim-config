return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        -- telescope
        { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "find files" },
        { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "grep" },
        { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "buffers" },
        { "<leader>fh", function() require('telescope.builtin').help_tags() end, desc = "help tags" },
        { "<leader>fk", function() require('telescope.builtin').keymaps() end, desc = "keymaps" },
        { "<leader>fS", function() require('telescope.builtin').spell_suggest() end, desc = "spell" },
        { "<leader>fG", function() require('telescope.builtin').git_branches() end, desc = "git branches" },
        { "<leader>fc", function() require('telescope.builtin').commands() end, desc = "commands" },
        { "<leader>fC", function() require('telescope.builtin').command_history() end, desc = "command history" },
        { "<leader>fq", function() require('telescope.builtin').quickfix() end, desc = "quickfix" },
        { "<leader>fM", function() require('telescope.builtin').man_pages() end, desc = "man" },
        { "<leader>fm", function() require('telescope.builtin').marks() end, desc = "makrs" },
        { "<leader>fj", function() require('telescope.builtin').jumplist() end, desc = "jumplist" },
        -- lsp
        {"<leader>lfr", function() require('telescope.builtin').lsp_references() end, desc = "references" },
        {"<leader>lfi", function() require('telescope.builtin').lsp_implementations() end, desc = "implementations" },
        {"<leader>lft", function() require('telescope.builtin').lsp_type_definitions() end, desc = "definitions" },
        {"<leader>lfs", function() require('telescope.builtin').lsp_document_symbols() end, desc = "documents symbols" },
        {"<leader>lfS", function() require('telescope.builtin').lsp_workspace_symbols() end, desc = "workspace symbols" },
        {"<leader>lfd", function() require('telescope.builtin').diagnostics() end, desc = "diagnostics" },
    },
}
