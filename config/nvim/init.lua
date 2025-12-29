if vim.fn.has("nvim-0.12.0") ~= 1 then
	local message = table.concat({
		"You are using an unsupported version of Neovim.",
		"",
		"This configs for nvim requires version  >= v0.12.0",
	}, "\n")
	vim.notify(message, vim.log.levels.ERROR)
end

local config_files = { "config", "core/lazy", "core/lsp" }
for _, config in ipairs(config_files) do
	local ok, err = pcall(require, config)
	if not ok then
		vim.notify("Failed to load " .. config .. ": " .. err, vim.log.levels.ERROR)
	end
end

-- Setup colorscheme with fallback
local colorscheme_ok, colorscheme_err = pcall(vim.cmd.colorscheme, "nordfox")
if not colorscheme_ok then
	vim.notify("Failed to load colorscheme 'nordfox': " .. colorscheme_err, vim.log.levels.WARN)
	vim.cmd.colorscheme("habamax") -- fallback to default
end
