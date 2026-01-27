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
			{ "<leader>c", icon = " ", group = "Cloak" },
			{ "<leader>t", icon = " ", group = "Terminal" },
			{ "<leader>u", icon = " ", group = "Undo tree" },
			{ "<leader>tf", icon = " ", group = "Terraform" },

			-- ignore these keys
			{ "<leader>Y", hidden = true },
			{ "<leader>y", hidden = true },
			{ "<leader>bx", hidden = true },
			{ "<leader>s", hidden = true },
		})
	end,
}
