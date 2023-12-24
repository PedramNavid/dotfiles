vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

local reg = require("vim.treesitter.language").register
reg("markdown", "mdx")
