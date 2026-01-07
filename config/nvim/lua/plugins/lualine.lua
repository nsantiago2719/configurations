return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
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
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
					},
				},
				lualine_x = {
					"filetype",
				},
				lualine_z = {
					{
						function()
							local schema = require("yaml-companion").get_buf_schema(0)
							if schema.result[1].name == "none" then
								return ""
							end
							return schema.result[1].name
						end,
					},
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
