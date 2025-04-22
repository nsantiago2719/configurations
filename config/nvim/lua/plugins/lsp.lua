return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		keys = {
			{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
		},
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"terraformls",
					"pyright",
					"rust_analyzer",
					"yamlls",
					"html",
					"eslint",
					"svelt",
					"cssls",
					"tailwindcss",
				},
			})

			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("svelt")
			vim.lsp.enable("cssls")
			vim.lsp.enable("eslint")
			vim.lsp.enable("pyright")
			vim.lsp.enable("gopls")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("html")
			vim.lsp.enable("tailwindcss")

			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = { "*.tf", "*.tfvars" },
				callback = function()
					vim.lsp.buf.format()
				end,
			})

			-- Jump to definitions and references under the cursor
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("neo-lsp-attach", { clear = true }),
				callback = function(event)
					-- Create function map for creating keymaps
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "Goto References")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				end,
			})
		end,
	},
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
	{
		"LittleEndianRoot/mason-conform",
		opts = {
			ensure_installed = { "prettierd", "stylua", "yamlfmt", "jq", "autopep8", "gofumpt" },
		},
	},
}
