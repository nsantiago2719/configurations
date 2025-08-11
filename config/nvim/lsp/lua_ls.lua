return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			completion = { enable = true },
			telemetry = { enable = false },
		},
	},
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_directory = {
		".git",
		".luarc.json",
		".luarc.jsonc",
	},
}
