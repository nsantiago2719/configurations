return {
	"laytan/cloak.nvim",
	keys = {
		{ "<leader>cc", "<cmd>CloakToggle<CR>", desc = "Toggle Cloak" },
		{ "<leader>cp", "<cmd>CloakPreviewLine<CR>", desc = "Cloak Preview Line" },
	},
	lazy = false,
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = "Comment",
			patterns = {
				{
					-- Match any file starting with ".env".
					-- This can be a table to match multiple file patterns.
					file_pattern = {
						".env*",
						"*.tfvars",
					},
					-- Match an equals sign and any character after it.
					-- This can also be a table of patterns to cloak,
					-- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
					cloak_pattern = { "=.+", ":.+" },
				},
			},
		})
	end,
}
