return {
	"someone-stole-my-name/yaml-companion.nvim",
	ft = { "yaml" },
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {
		builtin_matchers = {
			kubernetes = { enabled = true },
		},
	},
	config = function(_, opts)
		local cfg = require("yaml-companion").setup(opts)
		require("lspconfig")["yamlls"].setup(cfg)
		require("telescope").load_extension("yaml_schema")
	end,
}
