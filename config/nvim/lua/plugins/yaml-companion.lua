return {
	{
		"mosheavni/yaml-companion.nvim",
		ft = { "yaml" },
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function(_, opts)
			require("telescope").load_extension("yaml_schema")
		end,
	},
}
