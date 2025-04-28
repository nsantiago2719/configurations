return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		autochdir = true,
		widht = 30,
		height = 30,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		local Terminal = require("toggleterm.terminal").Terminal

		local wk = require("which-key")

		local toggle_lazygit = function()
			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float",
				hidden = true,
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function(_)
					vim.cmd("startinsert!")
				end,
			})
			lazygit:toggle()
		end

		local toggle_term = function()
			local term = Terminal:new({
				direction = "float",
				hidden = true,
			})
			term:toggle()
		end

		local terminal_mappings = {
			{ "<leader>t", group = "Terminal" },
			{ "<leader>tg", toggle_lazygit, desc = "LazyGit" },
			{ "<leader>tt", toggle_term, desc = "Terminal" },
		}

		wk.add(terminal_mappings)
	end,
}
