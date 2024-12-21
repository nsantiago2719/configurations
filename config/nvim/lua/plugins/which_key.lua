return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>f", group = "Search" },
			{ "<leader>ff", require("telescope.builtin").find_files, desc = "Find file" },
			{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live grep" },
			{ "<leader>ft", require("telescope").extensions["todo-comments"].todo, desc = "Find Todos" },
			{ "<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
			{ "<leader>e", group = "NvimTree" },
			{ "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle NvimTree" },
			{ "<leader>es", "<cmd>Neotree float git_status git_base=main<CR>", desc = "Git Status" },
			{ "<leader>eb", "<cmd>Neotree buffers<CR>", desc = "Buffers" },
			{ "<leader>c", group = "Cloak" },
			{ "<leader>cc", "<cmd>CloakToggle<CR>", desc = "Toggle Cloak" },
			{ "<leader>cp", "<cmd>CloakPreviewLine<CR>", desc = "Cloak Preview Line" },

			{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
			{ "<leader>g", "<cmd>LazyGit<CR>", desc = "LazyGit" },
			{ "<leader>l", "<cmd>Lazy<CR>", desc = "Lazy" },
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },

			-- ignore these keys
			{ "<leader>Y", hidden = true },
			{ "<leader>y", hidden = true },
		})
	end,
}
