local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")
local action_state = require("telescope.actions.state")

local colors = function(opts)
    opts = opts or {}
    local cmd = {
        "jq", "-c", [[select(.resource_type!="nmodel")
            | {name: .name, path: .original_file_path, type:.resource_type}
        ]], "ls.output"
    }
    opts.cwd = "~/projects/telescope.dbt"
    opts.entry_maker = function(entry)
        return {
            value = entry,
            display = vim.fn.json_decode(entry).name,
            path = opts.cwd .. "/" .. vim.fn.json_decode(entry).path,
            ordinal = vim.fn.json_decode(entry).name
        }
    end

    pickers.new(opts, {
        prompt_title = 'colors',
        finder = finders.new_oneshot_job(cmd, opts),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                print(vim.inspect(selection))
                action_set.edit(prompt_bufnr, "edit")
            end)
            return true
        end
    }):find()
end

colors(require('telescope.themes').get_dropdown {})
