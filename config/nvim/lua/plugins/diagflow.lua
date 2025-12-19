-- Lazy
return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	opts = {
		show_borders = true,
		format = function(diagnostic)
			return "[LSP] " .. diagnostic.message
		end,
	},
}
