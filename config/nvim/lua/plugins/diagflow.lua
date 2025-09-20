-- Lazy
return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	opts = {
		format = function(diagnostic)
			return "[LSP] " .. diagnostic.message
		end,
	},
}
