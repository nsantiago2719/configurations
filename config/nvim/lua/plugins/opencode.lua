return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{
			"folke/snacks.nvim",
			opts = {
				input = {
					enabled = true,
				},
				picker = {
					enabled = true,
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
				terminal = {},
			},
		},
	},
	opts = {},
	config = function()
		-- Required for `opts.events.reload`.
		vim.o.autoread = true
	end,
}
