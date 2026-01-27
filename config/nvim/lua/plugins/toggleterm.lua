return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm" },
	version = "*",
	opts = {
		autochdir = true,
		widht = 30,
		height = 30,
	},
	keys = {
		{ "<leader>tt", desc = "Terminal" },
		{ "<leader>ts", desc = "Terminal VSplit" },
		{ "<leader>tf", icon = " ", desc = "Terraform" },
		{ "<leader>tfi", desc = "init" },
		{ "<leader>tfp", desc = "plan" },
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

		local toggle_tf_init = function()
			local tf_init = Terminal:new({
				cmd = "terraform init",
				direction = "float",
			})

			tf_init:toggle()
		end

		local toggle_tf_plan = function()
			local tf_plan = Terminal:new({
				cmd = "terraform plan",
				direction = "float",
				close_on_exit = false,
				on_open = function(term)
					vim.cmd("stopinsert")
					vim.keymap.set("n", "q", function()
						term:close()
					end, { noremap = true, silent = true, buffer = term.bufnr })
				end,
			})

			tf_plan:toggle()
		end

		local toggle_term = function()
			local term = Terminal:new({
				direction = "float",
				hidden = true,
			})
			term:toggle()
		end

		local toggle_term_vsplit = function()
			local term = Terminal:new({
				direction = "horizontal",
			})
			term:toggle()
		end

		local terminal_mappings = {
			{ "<leader>t", group = "Terminal" },
			{ "<leader>tg", toggle_lazygit, desc = "LazyGit" },
			{ "<leader>tt", toggle_term, desc = "Terminal" },
			{ "<leader>ts", toggle_term_vsplit, desc = "Terminal VSplit" },
			{ "<leader>tf", group = "Terraform" },
			{ "<leader>tfi", toggle_tf_init, desc = "init" },
			{ "<leader>tfp", toggle_tf_plan, desc = "plan" },
		}

		wk.add(terminal_mappings)
	end,
}
