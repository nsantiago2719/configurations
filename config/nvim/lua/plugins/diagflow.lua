-- Lazy
return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	opts = {
		enable = function()
			return vim.bo.filetype ~= "lazy"
		end,
		show_borders = true,
		show_signs = true,
		scope = "line",
		format = function(diagnostic)
			return "[Diagnostics] " .. diagnostic.message
		end,
	},
}
