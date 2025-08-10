return {
	"supermaven-inc/supermaven-nvim",
	opts = {
		color = {
			suggestion_color = "#808080",
			cterm = 244,
		},
		keymaps = {
			accept_suggestion = "<Tab>",
		},
		log_level = "info", -- set to "off" to disable logging completely
		disable_inline_completion = false, -- enable inline completion when not using cmp
		disable_keymaps = false, -- disable built-in keymaps for manual control
		-- condition = function()
		--   return false -- disable supermaven when needed
		-- end,
	},
}
