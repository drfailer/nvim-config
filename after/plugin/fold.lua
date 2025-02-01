-- fold
function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local text = vim.fn.substitute(line, '{{{', '', 'g')
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    -- return "  " .. text .. " (" .. line_count .. " L)"
    return text .. " (" .. line_count .. " L)"
end

vim.g.custom_fold = true
vim.opt.foldmethod = 'marker'

if vim.g.custom_fold then
  vim.opt.foldtext = 'v:lua.custom_fold_text()'
  vim.opt.fillchars = { fold = ' ' }
end
