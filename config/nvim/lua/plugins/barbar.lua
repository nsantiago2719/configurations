return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	version = "^4.9.1",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = 5,
		insert_at_end = true,
		sidebar_filetypes = {
			NvimTree = {
				event = "BufWinLeave",
				text = "File Explorer",
				align = "center",
			},
		},
	},
	keys = {
		{ "<leader>bx", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Buffer close except current" },
		{ "L", "<cmd>BufferNext<cr>", desc = "Buffer Next" },
		{ "H", "<cmd>BufferPrevious<cr>", desc = "Buffer Prev" },
		{ "W", "<cmd>BufferClose<cr>", desc = "Buffer Close" },
	},
}
