return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"mfussenegger/nvim-lint",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
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
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
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

				--- Rust
				{
					"rust_analyzer",
				},

				--- Go
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
					"terraformls",
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
					"eslint" --[[ LS ]],
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
