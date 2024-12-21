return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		vim.cmd([[
      hi NotifyBackground guibg = #000000
    ]])
		vim.notify = require("notify")
	end,
}
