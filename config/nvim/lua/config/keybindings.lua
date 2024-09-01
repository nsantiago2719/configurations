-- Window mapping
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer mappings
vim.keymap.set('n', "<S-w>", "<cmd>bd<cr>", { desc = "Close buffer" })
vim.keymap.set('n', "<S-l>", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set('n', "<S-h>", "<cmd>bp<cr>", { desc = "Previous buffer" })
