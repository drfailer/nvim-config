local builtin = require('telescope.builtin')

return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        -- telescope
        { "<leader>ff", function() builtin.find_files() end, desc = "find files" },
        { "<leader>fg", function() builtin.live_grep() end, desc = "grep" },
        { "<leader>fb", function() builtin.buffers() end, desc = "buffers" },
        { "<leader>fh", function() builtin.help_tags() end, desc = "help tags" },
        { "<leader>fk", function() builtin.keymaps() end, desc = "keymaps" },
        { "<leader>fS", function() builtin.spell_suggest() end, desc = "spell" },
        { "<leader>fG", function() builtin.git_branches() end, desc = "git branches" },
        { "<leader>fc", function() builtin.commands() end, desc = "commands" },
        { "<leader>fC", function() builtin.command_history() end, desc = "command history" },
        { "<leader>fq", function() builtin.quickfix() end, desc = "quickfix" },
        { "<leader>fM", function() builtin.man_pages() end, desc = "man" },
        { "<leader>fm", function() builtin.marks() end, desc = "makrs" },
        { "<leader>fj", function() builtin.jumplist() end, desc = "jumplist" },
        -- lsp
        {"<leader>lfr", function() builtin.lsp_references() end, desc = "references" },
        {"<leader>lfi", function() builtin.lsp_implementations() end, desc = "implementations" },
        {"<leader>lft", function() builtin.lsp_type_definitions() end, desc = "definitions" },
        {"<leader>lfs", function() builtin.lsp_document_symbols() end, desc = "documents symbols" },
        {"<leader>lfS", function() builtin.lsp_workspace_symbols() end, desc = "workspace symbols" },
        {"<leader>lfd", function() builtin.diagnostics() end, desc = "diagnostics" },
    },
}
