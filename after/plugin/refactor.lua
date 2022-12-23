--------------------------------------------------------------------------------
--                                  REFACTOR                                  --
--------------------------------------------------------------------------------

require('refactoring').setup({
    prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
    },
    prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- Use telescope to select options
vim.api.nvim_set_keymap( "v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true })

-- debug printf
vim.api.nvim_set_keymap( "n", "<leader>rp", ":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true })

-- debug printf variable
vim.api.nvim_set_keymap("n", "<leader>rdv", ":lua require('refactoring').debug.print_var({ normal = true })<CR>",
  { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>rdv", ":lua require('refactoring').debug.print_var({})<CR>",
  { noremap = true })

-- cleanup debug printf
vim.api.nvim_set_keymap("n", "<leader>rdc", ":lua require('refactoring').debug.cleanup({})<CR>",
  { noremap = true })
