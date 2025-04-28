local go_checker = function()
	return os.execute("go version")
end

local python_checker = function()
	return os.execute("python --version")
end

local rust_checker = function()
	return os.execute("cargo version")
end

local terraform_checker = function()
	return os.execute("terraform version")
end

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
					condtion = python_checker,
				},
				{
					"pyright",
					condtion = python_checker,
				},
				{
					"autopep8",
					condtion = python_checker,
				},

				--- Rust
				{
					"rust_analyzer",
					condition = rust_checker,
				},

				--- Go
				{
					"gopls",
					condition = go_checker,
				},
				{
					"revive",
					condition = go_checker,
				},
				{
					"gofumpt",
					condition = go_checker,
				},

				--- Terraform
				{
					"tflint",
					condition = terraform_checker,
				},
				{
					"terraformls",
					condition = terraform_checker,
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
