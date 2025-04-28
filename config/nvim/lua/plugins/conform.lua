return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "yamlfmt" },
				json = { "jq" },
				python = { "autopep8" },
				go = { "gofumpt" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				css = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
	},
}
