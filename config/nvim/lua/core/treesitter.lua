vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4

function CustomFoldText()
	local start_line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1

	-- Remove trailing { and whitespace from the starting line
	local cleaned_start = start_line:gsub("%s*{%s*$", "")

	-- Create the dynamic display string
	-- Example Result: func Menu()  { ... } (15 lines)
	return cleaned_start .. " 󰅂  { ... } " .. " (" .. line_count .. " lines)"
end

-- Apply the function
vim.opt.foldtext = "v:lua.CustomFoldText()"

-- Ensure the dots from 'fillchars' don't clutter the end of the line
vim.opt.fillchars:append({ fold = " " })
