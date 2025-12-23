if vim.fn.has("nvim-0.12.0") ~= 1 then
	local message = table.concat({
		"You are using an unsupported version of Neovim.",
		"",
		"This configs for nvim requires version  >= v0.12.0",
	}, "\n")
	vim.notify(message, vim.log.levels.ERROR)
end

-- Load base config (settings, keybindings, autocmds)
local config_ok, config_err = pcall(require, "config")
if not config_ok then
	vim.notify("Failed to load config: " .. config_err, vim.log.levels.ERROR)
end

-- Load lazy for the plugins
local lazy_ok, lazy_err = pcall(require, "core/lazy")
if not lazy_ok then
	vim.notify("Failed to load lazy: " .. lazy_err, vim.log.levels.ERROR)
	return
end

-- Load LSP config after lazy to ensure dependencies are loaded
local lsp_ok, lsp_err = pcall(require, "core/lsp")
if not lsp_ok then
	vim.notify("Failed to load LSP config: " .. lsp_err, vim.log.levels.ERROR)
end

-- Setup colorscheme with fallback
local colorscheme_ok, colorscheme_err = pcall(vim.cmd.colorscheme, "nordfox")
if not colorscheme_ok then
	vim.notify("Failed to load colorscheme 'nordfox': " .. colorscheme_err, vim.log.levels.WARN)
	vim.cmd.colorscheme("habamax") -- fallback to default
end
