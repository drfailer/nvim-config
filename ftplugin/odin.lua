--------------------------------------------------------------------------------
--                                    odin                                    --
--------------------------------------------------------------------------------

require("dfconfig.functions")

-- build
key_add('n', '<leader>cc', '<CMD>make<CR>', { noremap = true, buffer = true})

-- headers
key_add('n', '<leader>FH', 'O<Escape>80i*<Escape>0r/$r/yyjpk<CMD>center 80<CR>0r/lr*<CMD>set virtualedit=all<CR>078lr*lr/:set virtualedit=none<CR>', { noremap = true, buffer = true })

-- search
key_add("n", "gd", ":vimgrep <C-r><C-w>\\s*: **/*.odin<CR>", { noremap = true, buffer = true })
key_add("n", "<leader>fs", function()
  require('telescope.builtin').grep_string({ search = ".* :: .*", grep_open_files = true, use_regex = true })
end, { noremap = true, buffer = true })

vim.cmd("compiler odin")
