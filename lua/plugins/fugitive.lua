return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gs", function() require("neogit").open({ kind = "split" }) end, desc = "open neogit" },
  }
}

-- return {
--   "tpope/vim-fugitive",
--   keys = {
--     { "<leader>gs", "<CMD>G<cr>", desc = "status" },
--     { "<leader>gc", "<CMD>G commit<cr>", desc = "commit" },
--     { "<leader>gp", "<CMD>G push<cr>", desc = "push" },
--     { "<leader>gL", "<CMD>G log<cr>", desc = "log" },
--     { "<leader>gm", ":G merge ", desc = "merge" },
--     { "<leader>gd", ":Gvdiffsplit!<cr>", desc = "diff split" },
--     { "<leader>gh", "<CMD>diffget //2<cr>", desc = "diff get left" },
--     { "<leader>gl", "<CMD>diffget //3<cr>", desc = "diff get right" },
--     { "<leader>gj", "]c", desc = "next diff" },
--     { "<leader>gk", "[c", desc = "next diff" },
--   }
-- }
