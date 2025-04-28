return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = 5,
		insert_at_end = true,
		sidebar_filetypes = {
			NvimTree = {
				text = "File Explorer",
				align = "center",
			},
		},
	},
	version = "^4.9.1",
}
