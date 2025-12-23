return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>l", "<cmd>Lazy<CR>", desc = "Lazy" },
			{ "<leader>f", group = "Search" },
			{ "<leader>e", icon = " ", group = "NvimTree" },
			{ "<leader>b", icon = "󰓩 ", group = "Tabs" },
			{ "<leader>c", icon = " ", group = "C commands" },
			{ "<leader>t", icon = " ", group = "C commands" },
			{ "<leader>u", icon = " ", group = "Undo tree" },

			-- ignore these keys
			{ "<leader>Y", hidden = true },
			{ "<leader>y", hidden = true },
			{ "<leader>bx", hidden = true },
		})
	end,
}
