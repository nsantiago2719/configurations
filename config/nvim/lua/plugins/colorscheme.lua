return {
	-- catpuccin theme
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavor = "mocha",
	-- 			transparent_background = false,
	-- 			auto_integrations = true,
	-- 			dim_inactive = {
	-- 				enabled = true,
	-- 				shade = "dark",
	-- 				percentage = 0.05,
	-- 			},
	-- 			custom_highlights = function(colors)
	-- 				return {
	-- 					NormalFloat = { bg = colors.base, fg = colors.text },
	-- 				}
	-- 			end,
	-- 		})
	-- 		-- load the colorscheme here
	-- 		vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },
	--
	-- nightfox theme which contains "nordfox" variant which is the
	-- current colorscheme
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				dim_inactive = true,
				styles = {
					comments = "italic",
					keywords = "bold,italic",
					functions = "bold",
				},
			},
		},
	},
}
