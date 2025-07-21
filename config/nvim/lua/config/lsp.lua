-- Description: LSP and related settings

local lsps = {
	"gopls",
	"pyright",
	"rust_analyzer",
	"html",
	"eslint",
	"svelte",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"yamlls",
}

local lsp_config = function(lsp, config)
	vim.lsp.config(lsp, config)
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.{yaml,yml}.{gotmpl,tpl}" }, -- Common Helm template extensions
	callback = function()
		vim.bo.filetype = "yaml.helm"
	end,
})

lsp_config("terraformls", {
	filetypes = { "terraform", "tf", "hcl" },
	initializationOptions = {
		experimentalFeatures = {
			prefillRequiredFields = true,
		},
	},
	settings = {
		validateOnSave = true,
	},
})

lsp_config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = { enable = true },
			telemetry = { enable = false },
		},
	},
})

lsp_config("helm_ls", {
	settings = {
		["helm-ls"] = {
			yamlls = {
				path = "yaml-language-server",
			},
		},
	},
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
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.enable(lsps)
