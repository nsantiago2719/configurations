return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				terraform = { "tflint" },
				lua = { "luacheck" },
				go = { "revive" },
				python = { "flake8" },
				typescript = { "eslint_d" },
				html = { "htmlhint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			ensure_installed = { "flake8", "revive", "luacheck", "tflint", "eslint_d", "htmlhint" },
		},
	},
}
