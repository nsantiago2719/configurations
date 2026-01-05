return {
	"laytan/cloak.nvim",
	keys = {
		{ "<leader>cc", "<cmd>CloakToggle<CR>", desc = "Toggle Cloak" },
		{ "<leader>cp", "<cmd>CloakPreviewLine<CR>", desc = "Cloak Preview Line" },
	},
	lazy = false,
	opts = {
		enabled = true,
		cloak_character = "*",
		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					".env*",
					"*.tfvars",
				},
				-- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
				cloak_pattern = { "=.+", ":.+" },
			},
		},
	},
}
