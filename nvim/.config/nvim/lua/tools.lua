local api = vim.api
local M = {}

function M.makeScratch()
    api.nvim_command('enew')
    vim.bo[0].buftype=nofile
    vim.bo[0].bufhidden=hide
    vim.bo[0].swapfile=false
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

return M
