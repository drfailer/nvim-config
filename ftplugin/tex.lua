-- some settings
vim.opt_local.shiftwidth = 2

-- comment header
vim.keymap.set('n', '<leader>FH', 'O%<Escape>78A-<Escape>A%<Escape>yyjpk<CMD>center 80<CR>0r%<CMD>set virtualedit=all<CR>079lr%:set virtualedit=none<CR>', { noremap = true, buffer = true })

-- search threw section
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').grep_string({ search = "section\\{.*\\}", grep_open_files = true, use_regex = true })
end, { noremap = true, buffer = true })

-- insert image using telescope
vim.keymap.set("i", "<M-i>i", function()
    require("dfconfig.telescope").telescope_file("Insert Image",
    { file_type = "f", cwd = "." , grep = ".*(\\.png|\\.jpg|\\.jpeg)" },
    function(result)
        vim.api.nvim_put({ result }, "", false, true)
        vim.api.nvim_input("a")
    end)
end, { noremap = true, buffer = true })

-- insert label using telescope
vim.keymap.set("i", "<M-i>l", function()
    require("dfconfig.telescope").telescope_grep("Insert Label",
    { pattern = "label" },
    function(result)
        local label = vim.fn.substitute(result, ".*\\label{\\(.*\\)}.*", "\\1", "")
        vim.api.nvim_put({ label }, "", false, true)
        vim.api.nvim_input("a")
    end)
end, { noremap = true, buffer = true })

-- compile document
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd("!pdflatex %")
end, { noremap = true, buffer = true })
