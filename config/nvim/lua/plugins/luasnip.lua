return {
	"L3MON4D3/LuaSnip",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.setup({
			enable_autosnippets = true,
			snip_env = {
				s = function(...)
					local snip = luasnip.s(...)
					table.insert(getfenv(2).ls_file_snippets, snip)
				end,
				parse = function(...)
					local snip = luasnip.parser.parse_snippet(...)
					table.insert(getfenv(2).ls_file_snippets, snip)
				end,
			},
		})

		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnips" })
	end,
}
