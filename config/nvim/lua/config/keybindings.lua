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
vim.keymap.set("n", "C", "<cmd>tabc<CR>", { desc = "Close Tab" })
-- open new tab after the last one
vim.keymap.set("n", "T", "<cmd>$tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "I", "<cmd>tabn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "U", "<cmd>tabp<CR>", { desc = "Previous Tab" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
