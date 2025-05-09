return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>f", group = "Search" },
			{ "<leader>e", group = "NvimTree" },
			{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
			{ "<leader>c", group = "C commands" },
			{ "<leader>l", "<cmd>Lazy<CR>", desc = "Lazy" },
			-- ignore these keys
			{ "<leader>Y", hidden = true },
			{ "<leader>y", hidden = true },
		})
	end,
}
