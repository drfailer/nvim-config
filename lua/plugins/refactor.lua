return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require('refactoring').setup({
            prompt_func_return_type = {
                go = false,
                java = false,
                cpp = true,
                c = true,
                h = true,
                hpp = true,
                cxx = true,
            },
            prompt_func_param_type = {
                go = false,
                java = false,
                cpp = true,
                c = true,
                h = true,
                hpp = true,
                cxx = true,
            },
            printf_statements = {
                cpp = {
                    'std::cout << "%s" << std::endl;'
                }
            },
            print_var_statements = {},
        })

        -- extract
        vim.keymap.set({ "n", "x" }, "<leader>re", function()
            return require('refactoring').refactor('Extract Function')
        end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>rf", function()
            return require('refactoring').refactor('Extract Function To File')
        end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>rv", function()
            return require('refactoring').refactor('Extract Variable')
        end, { expr = true })

        -- inline
        vim.keymap.set({ "n", "x" }, "<leader>rI", function()
            return require('refactoring').refactor('Inline Function')
        end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>ri", function()
            return require('refactoring').refactor('Inline Variable')
        end, { expr = true })

        -- block
        vim.keymap.set({ "n", "x" }, "<leader>rbb", function()
            return require('refactoring').refactor('Extract Block')
        end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>rbf", function()
            return require('refactoring').refactor('Extract Block To File')
        end, { expr = true })

        -- debug print
        vim.keymap.set("n", "<leader>rp", function()
            require('refactoring').debug.printf({below = false})
        end)
        vim.keymap.set({"x", "n"}, "<leader>rv", function()
            require('refactoring').debug.print_var()
        end)
        vim.keymap.set("n", "<leader>rc", function()
            require('refactoring').debug.cleanup({})
        end)
    end
}
