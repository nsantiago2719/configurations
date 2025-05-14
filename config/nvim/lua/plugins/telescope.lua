return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"folke/todo-comments.nvim",
		},
		keys = {
			{ "<leader>ff", require("telescope.builtin").find_files, desc = "Find file" },
			{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live grep" },
			{ "<leader>ft", require("telescope").extensions["todo-comments"].todo, desc = "Find Todos" },
			{ "<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
			{
				"<leader>fp",
				require("telescope").extensions.project.project,
				desc = "Telescope Project",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["todo-comments"] = {},
					project = {
						sync_with_nvim_tree = true,
					},
				},
			})
			telescope.load_extension("todo-comments")

			telescope.load_extension("project")
		end,
	},
}
