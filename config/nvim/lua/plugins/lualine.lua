return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				disabled_filetypes = { "NvimTree" },
				component_separators = "",
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_b = {
					"branch",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_x = {
					"copilot",
					"filetype",
				},
				lualine_z = {
					{
						function()
							return " " .. os.date("%R")
						end,
					},
				},
			},
		})
	end,
}
