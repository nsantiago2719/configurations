return {
  { "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    ensure_installed =  { "gopls", "rust_analyzer", "tflint", "pyright" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("lspconfig").rust_analyzer.setup {}
      require("lspconfig").pyright.setup {}
      require("lspconfig").gopls.setup {}
      require("lspconfig").tflint.setup {}
      require("lspconfig").ruby_lsp.setup {}
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        terraform = { "tflint" },
        ruby = { "standardrb" },
        lua = { "luacheck" },
        rust = { "bacon" },
        go = { "revive" },
        python = { "flake8" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      -- remove keymap for linting
      -- vim.keymap.set("n", "<leader>ll", function()
      --    lint.try_lint()
      -- end, { desc = "Trigger linting for current file" })
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylelua" },
          ruby = { "standardrb" },
          rust = { "rustfmt" },
          yaml = { "yamlfmt" },
          python = { "autopep8" },
          go = { "gofumpt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
     end,
  },

}
