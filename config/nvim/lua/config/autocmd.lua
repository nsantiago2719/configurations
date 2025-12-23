local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Remove trailing whitespaces and Windows line endings (^M) on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		-- Save cursor position to restore later
		local save_cursor = vim.fn.getpos(".")
		-- Remove Windows line endings (^M / carriage return)
		vim.cmd([[keeppatterns %s/\r$//e]])
		-- Remove trailing whitespace (keeppatterns to not affect search history)
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		-- Restore cursor position
		vim.fn.setpos(".", save_cursor)
	end,
})
