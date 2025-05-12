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
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_enable = false,
			hi_parameter = "",
			move_signature_window_key = { "<M-j>", "<M-k>", "<M-h>", "<M-l>" },
		},
		-- or use config
		-- config = function(_, opts) require'lsp_signature'.setup({you options}) end
	},
}
