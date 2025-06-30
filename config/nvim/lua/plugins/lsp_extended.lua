return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	{
		"icholy/lsplinks.nvim",
		config = function()
			local lsplinks = require("lsplinks")
			lsplinks.setup()
			vim.keymap.set("n", "gx", lsplinks.gx)
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			max_width = function()
				return vim.api.nvim_win_get_width(0)
			end,
			handler_opts = {
				border = "rounded",
			},
			zindex = 99,
			hint_enable = false,
			hi_parameter = "",
			move_signature_window_key = { "<M-j>", "<M-k>", "<M-h>", "<M-l>" },
		},
		-- or use config
		-- config = function(_, opts) require'lsp_signature'.setup({you options}) end
	},
}
