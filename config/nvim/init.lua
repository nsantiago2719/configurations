if vim.fn.has("nvim-0.12.0") ~= 1 then
	local message = table.concat({
		"You are using an unsupported version of Neovim.",
		"",
		"This configs for nvim requires version  >= v0.12.0",
	}, "\n")
	vim.notify(message, vim.log.levels.ERROR)
end

require("config")

--  Load lazy for the plugins
--  Load the LSP after lazy to load dependencies
require("core/lazy")
require("core/lsp")

-- setup colorscheme
vim.cmd.colorscheme("nordfox")
