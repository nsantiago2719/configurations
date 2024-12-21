return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		close_if_last_window = false,
		window = {
			width = 30,
			mappings = {
				["o"] = "open",
				["oc"] = "none",
				["od"] = "none",
				["og"] = "none",
				["om"] = "none",
				["on"] = "none",
				["os"] = "none",
				["ot"] = "none",
				["<2-leftmouse>"] = "none",
				-- git commands
				["gf"] = "git_add_file",
				["ga"] = "git_add_all",
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = {
					"node_modules",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
		},
	},
	keys = {},
}
