-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
vim.opt.splitright = true     -- set splitright

lvim.format_on_save.enabled = true
lvim.transparent_window = true


-- Enable core plugins included in lvim
lvim.builtin.indentlines.active = true
lvim.builtin.telescope.active = true

-- Set project to manual mode
lvim.builtin.project.manual_mode = true


-- custom mappings
lvim.keys.normal_mode["<S-w>"]   = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-l>"]   = ":bn<CR>"
lvim.keys.normal_mode["<S-h>"]   = ":bp<CR>"

-- disallow the usage of arrow keys on
-- normal mode
lvim.keys.normal_mode["<Up>"]    = "<cmd>echo \"dont use the arrow key!\"<CR>"
lvim.keys.normal_mode["<Down>"]  = "<cmd>echo \"dont use the arrow key!\"<CR>"
lvim.keys.normal_mode["<Left>"]  = "<cmd>echo \"dont use the arrow key!\"<CR>"
lvim.keys.normal_mode["<Right>"] = "<cmd>echo \"dont use the arrow key!\"<CR>"

-- nvim-tree open automatically
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw               = 1
vim.g.loaded_netrwPlugin         = 1

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- -- Hide files by default on nvim-tree
-- lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.active     = false

-- Plugins
lvim.plugins                     = {
  --{ "lunarvim/colorschemes" },
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
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
        },
      })
    end
  }
}


-- Whichkey bindings
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree<CR>", "NeoTree" }
