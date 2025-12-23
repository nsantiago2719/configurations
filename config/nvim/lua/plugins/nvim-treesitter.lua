function CustomFoldText()
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1

	-- 1. Handle Tabs: Expand them to spaces based on your 'tabstop'
	-- This prevents the "shifting" or conversion to single spaces.
	local tab_width = vim.opt.tabstop:get()
	local spacing = string.rep(" ", tab_width)
	local formatted_line = line:gsub("\t", spacing)

	-- 2. Clean the line (remove trailing {)
	local cleaned_start = formatted_line:gsub("%s*{%s*$", "")

	-- 3. Return the dynamic string
	return cleaned_start .. " 󰅂  { ... } (" .. line_count .. " lines)"
end

return {
	"nvim-treesitter/nvim-treesitter",
	-- use the latest stable release
	branch = "main",
	-- lazy not supported
	lazy = false,
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = function(_, opts)
		local tree_sitter = require("nvim-treesitter")
		tree_sitter.setup(opts)

		local ensure_installed = {
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
		}
		tree_sitter.install(ensure_installed)

		-- Ensure the dots from 'fillchars' don't clutter the end of the line
		vim.opt.fillchars:append({ fold = " " })

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if vim.list_contains(tree_sitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
					-- syntax highlighting, provided by Neovim
					vim.treesitter.start()
					-- folds, provided by Neovim
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"

					-- This is experimental in Neovim and may not work as expected
					-- indentation, provided by nvim-treesitter
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					vim.opt.foldcolumn = "0"
					vim.opt.foldtext = ""
					vim.opt.foldlevel = 99
					vim.opt.foldlevelstart = 1
					vim.opt.foldnestmax = 4
					-- Apply the function
					vim.opt.foldtext = "v:lua.CustomFoldText()"
				end
			end,
		})
	end,
}
