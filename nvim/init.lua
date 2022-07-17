require('settings')

<<<<<<< Updated upstream
require('plugins.init')
require('mappings')
require('macros')

function P(...)
    local objects = {}
    for i = 1, select('#', ...) do
=======
require("plugins.init")
require("mappings")
require("macros")

require("plugins.autopairs")
require("plugins.colorizer")
require("plugins.lsp")
require("plugins.nvim-cmp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.rust")

function P(...)
    local objects = {}
    for i = 1, select("#", ...) do
>>>>>>> Stashed changes
        local v = select(i, ...)
        table.insert(objects, vim.inspect(v))
    end

<<<<<<< Updated upstream
    print(table.concat(objects, '\n'))
=======
    print(table.concat(objects, "\n"))
>>>>>>> Stashed changes
    return ...
end

-- vim: foldmethod=marker foldlevel=0:
