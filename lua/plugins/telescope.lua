return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()

        -- keymaps
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" } )
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "keymaps" })
        vim.keymap.set("n", "<leader>fS", builtin.spell_suggest, { desc = "spell" })
        vim.keymap.set("n", "<leader>fG", builtin.git_branches, { desc = "git branches" })
        vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "commands" })
        vim.keymap.set("n", "<leader>fC", builtin.command_history, { desc = "command history" })
        vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "quickfix" })
        vim.keymap.set("n", "<leader>fM", builtin.man_pages, { desc = "man" })
        vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "makrs" })
        vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "jumplist" })

        -- pick and insert a file (relative path)
        vim.keymap.set("i", "<C-f><C-f>", function()
            require("dfconfig.telescope").telescope_file("Insert File",
            { file_type = "f", cwd = "." },
            function(result)
                vim.api.nvim_put({ result }, "", false, true)
                vim.api.nvim_input("a")
            end)
        end, { noremap = true })
    end
}
