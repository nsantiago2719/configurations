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
	"terraformls",
	"helm-ls",
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.{yaml,yml}.{gotmpl,tpl}" }, -- Common Helm template extensions
	callback = function()
		vim.bo.filetype = "yaml.helm"
	end,
})

-- Enable vim.lsp features
-- e.g. auto-completion
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("auto-lsp-group", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		if client:supports_method("textDocumentImplementation") then
			map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
			map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
			map("gR", require("telescope.builtin").lsp_references, "Goto References")

			-- Show signature help under the cursor
			map("gH", function()
				return vim.lsp.buf.signature_help()
			end, "Signature Help")
		end

		-- Native support for auto completion
		if client:supports_method("textDocument/completion") then
			vim.opt.completeopt = { "menu", "menuone", "fuzzy", "popup", "noinsert" }
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
			map("<C-Space>", function()
				vim.lsp.completion.get()
			end, "Completion", "i")
		end
	end,
})

vim.lsp.enable(lsps)
