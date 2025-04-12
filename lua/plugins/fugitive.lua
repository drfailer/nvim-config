return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs", "<CMD>G<cr>" },
        { "<leader>gc", "<CMD>G commit<cr>" },
        { "<leader>gp", "<CMD>G push<cr>" },
        { "<leader>gL", "<CMD>G log<cr>" },
        { "<leader>gm", ":G merge " },
        { "<leader>gd", ":Gvdiffsplit!<cr>" },
        { "<leader>gh", "<CMD>diffget //2<cr>" },
        { "<leader>gl", "<CMD>diffget //3<cr>" },
        { "<leader>gj", "]c" },
        { "<leader>gk", "[c" },
    }
}
