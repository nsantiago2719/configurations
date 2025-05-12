return {
	"MeanderingProgrammer/render-markdown.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	--- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		overrides = {
			buftype = {
				nofile = {
					code = {
						style = "normal",
						highlight = "NormalFloat",
						highlight_inline = "NormalFloat",
					},
				},
			},
		},
	},
}
