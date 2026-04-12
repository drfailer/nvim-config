vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim.git",
    "https://github.com/nvim-lua/plenary.nvim.git",
})

local picker_theme = {
    theme = "ivy",
    results_height = 25,
    previewer = false,
    layout_config = { height = 0.2 },
}

require("telescope").setup({
    pickers = {
        find_files = picker_theme,
        live_grep = picker_theme,
        grep_string = picker_theme,
        buffers = picker_theme,
        buffers = picker_theme,
        spell_suggest = picker_theme,
        man_pages = picker_theme,
        marks = picker_theme,
    },
})

-- keymaps
local builtin = require("telescope.builtin")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

nmap("<leader>ff", builtin.find_files, "find files")
nmap("<leader>fg", builtin.live_grep, "grep")
nmap("<leader>fb", builtin.buffers, "buffers")
nmap("<leader>fh", builtin.help_tags, "help tags")
nmap("<leader>fk", builtin.keymaps, "keymaps")
nmap("<leader>fS", builtin.spell_suggest, "spell")
nmap("<leader>fG", builtin.git_branches, "git branches")
nmap("<leader>fc", builtin.commands, "commands")
nmap("<leader>fM", builtin.man_pages, "man")
nmap("<leader>fm", builtin.marks, "makrs")
nmap("<leader>fj", builtin.jumplist, "jumplist")

-- pick and insert a file (relative path)
imap("<C-f><C-f>", function()
    require("dfmodules.telescope").telescope_file("Insert File",
    { file_type = "f", cwd = "." },
    function(result)
        vim.api.nvim_put({ result }, "", false, true)
        vim.api.nvim_input("a")
    end)
end, "insert file")

-- search simbol under cursor
nmap("<C-f><C-f>", function()
  vim.cmd.normal("\"fyiw")
  require('telescope.builtin').grep_string({ search = vim.fn.getreg("f"), case_sensitive = true })
end, "find")

vmap("<C-f><C-f>", function()
  vim.cmd.normal("\"fy")
  require('telescope.builtin').grep_string({ search = vim.fn.getreg("f"), case_sensitive = true })
end)
