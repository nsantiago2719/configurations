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
						"macro",
						fmt = function()
							local reg = vim.fn.reg_recording()
							if reg ~= "" then
								return "Recording @" .. reg
							end
							return nil
						end,
						color = { fg = "#ff9e64" },
						draw_empty = false,
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
