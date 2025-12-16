return {
	{
		"mason-org/mason.nvim",
		lazy = true,
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"mfussenegger/nvim-lint",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		keys = {
			{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
		},
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				--- Github copilot lsp
				{ "copilot-language-server" },
				--- Lua
				{ "lua_ls" },
				{ "stylua" },
				{ "luacheck" },

				--- Python
				{
					"flake8",
				},
				{
					"pyright",
				},
				{
					"autopep8",
				},

				{
					"gopls",
				},
				{
					"revive",
				},
				{
					"gofumpt",
				},

				--- Terraform
				{
					"tflint",
				},
				{
					"terraform-ls",
				},

				--- helm
				{
					"kube-linter",
				},
				{
					"helm-ls",
				},

				--- YAML
				{ "yaml-language-server" },
				{ "yamlfmt" },

				--- General
				-- Formater
				{ "jq" },
				{ "prettierd" },
				-- Javascript, Typescript
				{
					"eslint_d", --[[ Linter ]]
				},
				{ "svelte" },
				{
					"typescript-language-server", --[[ LS ]]
				},
				-- HTML
				{ "htmlhint" },
				{ "html" },
				-- CSS
				{ "cssls" },
				{ "tailwindcss" },
			},
		},
		auto_update = true,
		integrations = {
			["mason-null-ls"] = false,
			["mason-nvim-dap"] = false,
		},
	},
}
