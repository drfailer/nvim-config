return {
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
        -- return vim.fn.executable('gcc') or vim.fn.executable('clang')
        return not (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)
    end,
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'c', 'c++', 'asm', 'odin' },
            callback = function() vim.treesitter.start() end,
        })
    end
}
