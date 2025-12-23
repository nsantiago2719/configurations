-- Window mapping
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Tab mappings
-- won't close if there is only one tab
vim.keymap.set("n", "<leader>bc", "<cmd>tabc<CR>", { desc = "Close Tab" })
-- open new tab after the last one
vim.keymap.set("n", "<leader>bn", "<cmd>$tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>bh", "<cmd>tabn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>bl", "<cmd>tabp<CR>", { desc = "Previous Tab" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Opencode mappings
vim.keymap.set("n", "<C-x>", function()
	require("opencode").select()
end, { desc = "Execute opencode action…" })
vim.keymap.set("n", "<leader>to", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go", function()
	return require("opencode").operator("@this ")
end, { expr = true, desc = "Add range to opencode" })
vim.keymap.set("n", "goo", function()
	return require("opencode").operator("@this ") .. "_"
end, { expr = true, desc = "Add line to opencode" })

-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
