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
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- List of lsp to install
			local lsps = {
				"gopls",
				"terraformls",
				"pyright",
				"rust_analyzer",
				"yamlls",
				"html",
				"eslint",
				"svelte",
				"cssls",
				"tailwindcss",
			}
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})

			for _, lsp in ipairs(lsps) do
				vim.lsp.enable(lsp)

				vim.lsp.config(lsp, {
					capabilities = lsp_capabilities,
				})
			end

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
}
