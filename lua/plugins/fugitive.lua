vim.pack.add({"https://github.com/tpope/vim-fugitive.git"})

require("dfconfig.functions")

nmap("<leader>gs", "<CMD>G<cr>", "status")
nmap("<leader>gc", "<CMD>G commit<cr>", "commit")
nmap("<leader>gp", "<CMD>G push<cr>", "push")
nmap("<leader>gL", "<CMD>G log<cr>", "log")
nmap("<leader>gm", ":G merge ", "merge")
nmap("<leader>gd", ":Gvdiffsplit!<cr>", "diff split")
nmap("<leader>gh", "<CMD>diffget //2<cr>", "diff get left")
nmap("<leader>gl", "<CMD>diffget //3<cr>", "diff get right")
nmap("<leader>gj", "]c", "next diff")
nmap("<leader>gk", "[c", "next diff")
