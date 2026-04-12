vim.pack.add({"https://github.com/nvim-mini/mini.comment.git"})

require("mini.comment").setup({
    mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
    },
})
