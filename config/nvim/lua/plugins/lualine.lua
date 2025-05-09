return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local colors = {
			bg = "#202328",
			fg = "#bbc2cf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67",
		}
		require("lualine").setup({
			options = {
				disabled_filetypes = { "NvimTree" },
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
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
