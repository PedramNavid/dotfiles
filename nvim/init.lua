require("settings")

require("plugins.init")
require("plugins.colorizer")
require("plugins.lsp")
require("plugins.nvim-cmp")
require("plugins.treesitter")
require("plugins.rust")
require("mappings")
require("macros")

function P(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- vim: foldmethod=marker foldlevel=0:
