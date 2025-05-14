return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"b0o/schemastore.nvim",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			-- List of lsp to install
			local lsps = {
				"gopls",
				"terraformls",
				"pyright",
				"rust_analyzer",
				"html",
				"eslint",
				"svelte",
				"cssls",
				"tailwindcss",
				"lua_ls",
			}
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = { "*.{yaml,yml}.{gotmpl,tpl}" }, -- Common Helm template extensions
				callback = function()
					vim.bo.filetype = "yaml.helm"
				end,
			})

			local lsp_config = function(lsp, config)
				vim.lsp.enable(lsp)
				vim.lsp.config(lsp, config)
			end

			-- enable lsp with default settings and lsp_capabilities
			for _, lsp in ipairs(lsps) do
				lsp_config(lsp, {
					capabilities = lsp_capabilities,
				})
			end

			lsp_config("yamlls", {
				capabilities = lsp_capabilities,
				filetypes = { "yaml", "yml" },
				settings = {
					yaml = {
						hover = true,
						validate = true,
						completion = true,
						schemas = {
							kubernetes = { "/*.k8s.yaml" },
						},
					},
				},
			})

			lsp_config("helm_ls", {
				capabilities = lsp_capabilities,
				settings = {
					["helm-ls"] = {
						yamlls = {
							config = {
								schemas = {
									kubernetes = { "*./*.k8s.ya?ml", ".*/templates/*.yaml" },
								},
							},
						},
					},
				},
			})

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
