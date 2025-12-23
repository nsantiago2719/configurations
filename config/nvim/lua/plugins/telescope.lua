return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"folke/todo-comments.nvim",
		},
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find file" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
			{ "<leader>fw", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Workspace symbols" },
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
			
			-- Lazy load extensions on first use
			local extensions_loaded = {}
			local function ensure_extension(name)
				if not extensions_loaded[name] then
					telescope.load_extension(name)
					extensions_loaded[name] = true
				end
			end
			
			-- Set up keymaps that load extensions on demand
			vim.keymap.set("n", "<leader>ft", function()
				ensure_extension("todo-comments")
				telescope.extensions["todo-comments"].todo()
			end, { desc = "Find Todos" })
			
			vim.keymap.set("n", "<leader>fp", function()
				ensure_extension("project")
				telescope.extensions.project.project()
			end, { desc = "Telescope Project" })
		end,
	},
}
