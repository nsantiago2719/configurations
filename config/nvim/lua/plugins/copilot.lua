return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			nes = { enabled = false },
			should_attach = function(_, bufname)
				if string.match(bufname, ".envrc") then
					return false
				end
				return true
			end,
		},
	},
	{
		"hendrikpetertje/copilot-cmp",
		branch = "fix-deprecated-errors",
		config = function()
			require("copilot_cmp").setup({
				fix_pairs = true,
			})
		end,
	},
}
