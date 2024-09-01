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
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file"},
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>e", "<cmd>Neotree<cr>", desc = "NvimTree" },
      })
    end,
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
  }
}

