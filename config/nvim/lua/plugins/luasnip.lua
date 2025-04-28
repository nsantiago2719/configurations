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
		local ls = require("luasnip")
		ls.config.set_config({
			enable_autosnippet = true,
		})
		ls.setup({
			snip_env = {
				s = function(...)
					local snip = ls.s(...)
					table.insert(getfenv(2).ls_file_snippets, snip)
				end,
				parse = function(...)
					local snip = ls.parser.parse_snippet(...)
					table.insert(getfenv(2).ls_file_snippets, snip)
				end,
			},
		})
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnips" })
	end,
}
