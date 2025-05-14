return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
				},
				lualine_x = {
					"fileformat",
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
