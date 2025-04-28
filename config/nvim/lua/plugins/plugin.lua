return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavor = "mocha",
				transparent_background = false,
				integrations = {
					cmp = true,
					notify = true,
					neotree = true,
					telescope = {
						enabled = true,
					},
					which_key = true,
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			exclude = {
				filetypes = {
					"help",
					"dart",
					"startify",
					"dashboard",
					"packer",
					"neogitstatus",
					"NvimTree",
					"Trouble",
					"checkhealth",
					"man",
					"lsp",
				},
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"nvimdev/dashboard-nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		lazy = false,
		opts = function()
			local logo = [[
     ██╗ █████╗ ███████╗██╗     
     ██║██╔══██╗██╔════╝██║     
     ██║███████║█████╗  ██║     
██   ██║██╔══██║██╔══╝  ██║     
╚█████╔╝██║  ██║███████╗███████╗
 ╚════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
 [https://l4z.xyz] [https://www.github.com/nsantiago2719]

 Heroes are nothing without villains.
        ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{ action = "NvimTreeToggle", desc = " NvimTree", icon = " ", key = "e" },
						{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
						{
							action = require("telescope.builtin").oldfiles,
							desc = " Recent Files",
							icon = " ",
							key = "r",
						},
						{
							action = require("telescope.builtin").find_files,
							desc = " Find files",
							icon = "󰱼 ",
							key = "f",
						},
						{
							action = require("telescope").extensions.project.project,
							desc = " Projects",
							icon = " ",
							key = "p",
						},
						{
							action = function()
								local tree_api = require("nvim-tree.api")
								local config_path = vim.fn.stdpath("config")
								vim.api.nvim_input("<cmd>cd " .. config_path .. "<cr>")
								tree_api.tree.open({ path = config_path })
							end,
							desc = " NeoVim Config",
							icon = " ",
							key = "c",
						},
						{
							action = function()
								vim.api.nvim_input("<cmd>qa<cr>")
							end,
							desc = " Quit",
							icon = " ",
							key = "q",
						},
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}
			return opts
		end,
	},
}
