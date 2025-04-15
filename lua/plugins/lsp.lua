return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("dfconfig.lsp.lsp-config")
        require("dfconfig.lsp.mason")
    end
}
