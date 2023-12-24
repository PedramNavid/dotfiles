return {
	"https://github.com/rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			render = "minimal",
			timeout = 1000,
			animation_style = "fade",
			max_width = function()
				return math.floor(vim.o.columns * 0.65)
			end,
		})

		vim.notify = notify
	end,
}
