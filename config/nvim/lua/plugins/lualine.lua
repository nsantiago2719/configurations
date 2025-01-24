return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			optiosn = {
				sections = {
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
			},
		})
	end,
}
