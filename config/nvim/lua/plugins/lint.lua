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

			require("lint").linters.kube_linter = {
				cmd = "kube-linter",
				stdin = false,
				stream = "stdout",
				args = { "lint", "--format", "json" },
				ignore_exitcode = true,
				parser = function(output)
					if output == "" then
						return {}
					end

					local decode = vim.json.decode(output)
					if decode == nil then
						return {}
					end

					local reports = decode.Reports

					local diagnostics = {}
					for _, item in ipairs(reports) do
						table.insert(diagnostics, {
							--- TODO: Use proper line number
							--- NOTE: kube-linter does not support line numbers yet: https://github.com/stackrox/kube-linter/issues/45
							lnum = 0,
							col = 0,
							message = item.Diagnostic.Message,
						})
					end

					return diagnostics
				end,
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
}
