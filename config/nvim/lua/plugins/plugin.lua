return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavor = "mocha",
				transparent_background = true,
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
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
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
						{ action = "NvimTreeToggle", desc = " NvimTree", icon = " ", key = "e" },
						{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
						{
							action = require("telescope.builtin").oldfiles,
							desc = " Recent Files",
							icon = " ",
							key = "r",
						},
						{ action = "Telescope project", desc = " Projects", icon = " ", key = "p" },
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
