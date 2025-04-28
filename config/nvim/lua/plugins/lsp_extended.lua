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
}
