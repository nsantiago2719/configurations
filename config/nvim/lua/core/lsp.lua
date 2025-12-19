-- Description: LSP and related settings
local lsps = {
	"gopls",
	"pyright",
	"html-lsp",
	"typescript-language-server",
	"svelte",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"yamlls",
	"terraform-ls",
	"helm-ls",
	"copilot-language-server",
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.{yaml,yml}.{gotmpl,tpl}" }, -- Common Helm template extensions
	callback = function()
		vim.bo.filetype = "yaml.helm"
	end,
})

-- Enable vim.lsp features
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("auto-lsp-group", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		if client:supports_method("textDocument/definition") then
			map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
		end

		if client:supports_method("textDocument/references") then
			map("gR", require("telescope.builtin").lsp_references, "Goto References")
		end

		if client:supports_method("textDocument/signatureHelp") then
			map("gH", function()
				return vim.lsp.buf.signature_help()
			end, "Signature Help")
		end

		if client:supports_method("textDocumentImplementation") then
			map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
		end

		-- Rename all references to the symbol under the cursor
		map("rR", vim.lsp.buf.rename, "Rename Symbol")

		-- Support for copilot-language-server inline completions
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
			vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

			vim.keymap.set("i", "<Tab>", function()
				if not vim.lsp.inline_completion.get() then
					return "<Tab>"
				end
			end, { expr = true, buffer = bufnr, desc = "LSP: Accept inline completion" })

			vim.keymap.set(
				"i",
				"<C-G>",
				vim.lsp.inline_completion.select,
				{ desc = "LSP: switch inline completion", buffer = bufnr }
			)
		end
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable(lsps)
