return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<c-space>", desc = "Increment Selection" },
		{ "<bs>", desc = "Decrement Selection", mode = "x" },
	},
	opts_extend = { "ensure_installed" },
	---@type TSConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		ensure_installed = {
			"helm",
			"bash",
			"html",
			"json",
			"css",
			"lua",
			"luadoc",
			"go",
			"gotmpl",
			"rust",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"yaml",
			"svelte",
			"terraform",
			"javascript",
			"typescript",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			move = {
				enable = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
					["]a"] = "@parameter.inner",
				},
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.inner",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
					["[C"] = "@class.outer",
					["[A"] = "@parameter.inner",
				},
			},
		},
	},
	---@param opts TSConfig
	config = function(_, opts)
		vim.filetype.add({
			extension = {
				gotmpl = "gotmpl",
			},
			pattern = {
				[".*/templates/.*%.tpl"] = "helm",
				[".*/templates/.*%.ya?ml"] = "helm",
				["helmfile.*%.ya?ml"] = "helm",
			},
		})
		require("nvim-treesitter.configs").setup(opts)
	end,
}
