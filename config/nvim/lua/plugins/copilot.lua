return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
	lazy = true,
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
			server_opts_overrides = {
				settings = {
					telemetry = {
						telemetryLevel = "off",
					},
				},
			},
		})
		require("copilot_cmp").setup()
	end,
}
