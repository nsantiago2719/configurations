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
					condtion = function()
						if os.execute("python --version") == 0 then
							return 1
						else
							return nil
						end
					end,
				},
				{
					"pyright",
					condtion = function()
						return os.execute("python --version")
					end,
				},
				{
					"autopep8",
					condtion = function()
						return os.execute("python --version")
					end,
				},

				--- Rust
				{
					"rust_analyzer",
					condition = function()
						return os.execute("cargo version")
					end,
				},

				--- Go
				{
					"gopls",
					condition = function()
						return os.execute("go version")
					end,
				},
				{
					"revive",
					condition = function()
						return os.execute("go version")
					end,
				},
				{
					"gofumpt",
					condition = function()
						return os.execute("go version")
					end,
				},

				--- Terraform
				{
					"tflint",
					condition = function()
						return os.execute("terraform version")
					end,
				},
				{
					"terraformls",
					condition = function()
						return os.execute("terraform version")
					end,
				},

				--- helm
				{
					"kube-linter",
				},
				{
					"helm-ls",
					condition = function()
						return os.execute("helm version")
					end,
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
