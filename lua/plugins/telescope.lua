return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- keys = {
    --     { "<leader>ff", function() require("telescope.builtin").find_files() end },
    --     { "<leader>fg", function() require("telescope.builtin").live_grep() end },
    --     { "<leader>fb", function() require("telescope.builtin").buffers() end },
    --     { "<leader>fh", function() require("telescope.builtin").help_tags() end },
    --     { "<leader>fk", function() require("telescope.builtin").keymaps() end },
    --     { "<leader>fS", function() require("telescope.builtin").spell_suggest() end },
    --     { "<leader>fG", function() require("telescope.builtin").git_branches() end },
    --     { "<leader>fc", function() require("telescope.builtin").commands() end },
    --     { "<leader>fC", function() require("telescope.builtin").command_history() end },
    --     { "<leader>fq", function() require("telescope.builtin").quickfix() end },
    --     { "<leader>fM", function() require("telescope.builtin").man_pages() end },
    --     { "<leader>fm", function() require("telescope.builtin").marks() end },
    --     { "<leader>fj", function() require("telescope.builtin").jumplist() end },
    -- },
    config = function()
        require('telescope').setup()

        local builtin = require('telescope.builtin')

        -- mappings
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
        vim.keymap.set('n', '<leader>fS', builtin.spell_suggest, {})
        vim.keymap.set('n', '<leader>fG', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fC', builtin.command_history, {})
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
        vim.keymap.set('n', '<leader>fM', builtin.man_pages, {})
        vim.keymap.set('n', '<leader>fm', builtin.marks, {})
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})

        -- lsp
        vim.keymap.set('n', '<leader>lfr', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>lfi', builtin.lsp_implementations, {})
        vim.keymap.set('n', '<leader>lft', builtin.lsp_type_definitions, {})
        vim.keymap.set('n', '<leader>lfs', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>lfS', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>lfd', builtin.diagnostics, {})
    end
}
