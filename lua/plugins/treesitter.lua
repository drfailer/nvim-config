if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    return
end

vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter.git"})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp', 'asm', 'odin' },
    callback = function() vim.treesitter.start() end,
})
