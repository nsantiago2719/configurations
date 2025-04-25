if vim.fn.has("nvim-0.11.0") ~= 1 then
	local message = table.concat({
		"You are using an unsupported version of Neovim.",
		"",
		"This configs for nvim requires version  >= v0.11.0",
	}, "\n")
	vim.notify(message, vim.log.levels.ERROR)
end
require("config")
