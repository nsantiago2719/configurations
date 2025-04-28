return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"someone-stole-my-name/yaml-companion.nvim",
		},
		keys = {
			{ "<leader>ff", require("telescope.builtin").find_files, desc = "Find file" },
			{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live grep" },
			{ "<leader>ft", require("telescope").extensions["todo-comments"].todo, desc = "Find Todos" },
			{ "<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
			{
				"<leader>fy",
				"<cmd>Telescope yaml_schema<CR>",
				desc = "Select YAML schema",
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

			telescope.load_extension("yaml_schema")
			telescope.load_extension("project")

			vim.api.nvim_set_keymap(
				"n",
				"<leader>fp",
				":lua require'telescope'.extensions.project.project{}<cr>",
				{ noremap = true, silent = true, desc = "Projects" }
			)
		end,
	},
}
