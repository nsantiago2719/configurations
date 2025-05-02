return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = function()
		vim.g.nvim_tree_disable_default_keybindings = 1
		local function custom_keybinds(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "O", api.node.open.tab, opts("Open Tab"))
			vim.keymap.set("n", "s", api.node.open.vertical, opts("Open Vertical"))
			vim.keymap.set("n", "S", api.node.open.horizontal, opts("Open Horizontal"))
			vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
			vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "H", api.tree.toggle_enable_filters, opts("Toggle All Filters"))
			vim.keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
			vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Change Root"))
			vim.keymap.set("n", "l", api.node.navigate.sibling.next, opts("Next Sibling"))
			vim.keymap.set("n", "h", api.node.navigate.sibling.prev, opts("Previous Sibling"))
			vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		end

		local opts = {
			view = {
				width = 30,
			},
			filters = {
				dotfiles = true,
			},
			on_attach = custom_keybinds,
			update_focused_file = {
				enable = true,
				update_root = {
					enable = true,
				},
			},
			actions = {
				change_dir = {
					global = true,
				},
			},
			renderer = {
				hidden_display = "simple",
				decorators = { "Git", "Hidden" },
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},

					git_placement = "after",
				},
			},
		}

		return opts
	end,
}
