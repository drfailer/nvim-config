local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local telescope_cmd = function(title, cmd, callback, opts, sorter)
    pickers.new(opts, {
        prompt_title = title,
        finder = finders.new_oneshot_job(cmd, opts),
        -- finder = finders.new_job(cmd, opts),
        sorter = sorter,
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                callback(selection[1])
            end)
            return true
        end,
        previewer = conf.grep_previewer(opts),
    }):find()
end


local telescope_grep = function(title, opts, callback)
    local result = ""
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()
    local cmd = { "grep", "-E", opts.pattern }

    if opts.file then
        table.insert(cmd, opts.file)
    else
        table.insert(cmd, "-Rn")
    end

    telescope_cmd(title, cmd, callback, opts, conf.generic_sorter(opts))
end

local telescope_file = function(title, opts, callback)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()
    local cmd = { "find", opts.cwd }

    if opts.file_name then
        table.insert(cmd, "-name")
        table.insert(cmd, opts.file_name)
    end

    if opts.file_type then
        table.insert(cmd, "-type")
        table.insert(cmd, opts.file_type)
    end

    if opts.grep then
        table.insert(cmd, "-regextype")
        table.insert(cmd, "egrep")
        table.insert(cmd, "-regex")
        table.insert(cmd, opts.grep)
    end

    print(vim.inspect(cmd))

    telescope_cmd(title, cmd, callback, opts, conf.file_sorter(opts))
end

return {
    telescope_file = telescope_file,
    telescope_grep = telescope_grep,
}
