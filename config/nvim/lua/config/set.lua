vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.showmode = false
vim.opt.expandtab = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.scrolloff = 10
vim.opt.cursorline = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.autoread = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set custom filetype for helm and gotmpl files
vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
	},
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
	},
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
})
