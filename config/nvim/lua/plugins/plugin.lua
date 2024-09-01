return {
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-frappe]])
    end,
  },
  { "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.add({
        { "<leader>f", group = "Search" },
        { "<leader>ff", require('telescope.builtin').find_files, desc = "Find file"},
        { "<leader>fg", require('telescope.builtin').live_grep, desc = "Live grep"},
        { "<leader>ft", require('telescope').extensions['todo-comments'].todo, desc = "Find Todos"},
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>e", "<cmd>Neotree<cr>", desc = "NvimTree" },
        { "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{}
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
       close_if_last_window = false,
        window = {
          width = 30,
          mappings = {
            ["o"] = "open",
            ["oc"] = "none",
            ["od"] = "none",
            ["og"] = "none",
            ["om"] = "none",
            ["on"] = "none",
            ["os"] = "none",
            ["ot"] = "none",
            ["<2-leftmouse>"] = "none",
            -- git commands
            ["gf"] = "git_add_file",
            ["ga"] = "git_add_all",
          }
       },
       buffers = {
          follow_current_file = {
            enabled = true
          },
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
             "node_modules"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db"
          },
        },
      }
    },
    keys = {
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
}

