return {
  -- Autocompletion plugin and its dependencies
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "hrsh7th/cmp-cmdline",
        event = { "CmdLineEnter" },
        opts = { history = true, updateevents = "CmdlineEnter,CmdlineChanged" },
        config = function()
          return require "configs.cmp-cmdline"
        end,
      },
    },
    -- Configure nvim-cmp with NvChad's default options merged with your custom options
    config = function()
      local cmp = require "cmp"
      local nvchad_opts = require "nvchad.configs.cmp" -- NvChad default cmp options
      local custom_opts = require "configs.nvim-cmp" -- your custom cmp options

      nvchad_opts.mapping = custom_opts.mapping -- if you want to use your mappings
      local opts = vim.tbl_deep_extend("force", nvchad_opts, custom_opts)
      cmp.setup(opts)
    end,
  },

  -- Code formatting plugin
  -- {
  --   "stevearc/conform.nvim",
  --   event = "BufWritePre", -- uncomment for format on save
  --   opts = require "configs.conform",
  --  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  --Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = require "configs.treesitter",
    highlight = {
      enable = true,
    },
  },

  -- Linting plugin
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  -- neovim debug adapter protocol client
  {
    "mfussenegger/nvim-dap",
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },

  -- Code formatter
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "configs.formatter"
  --   end,
  -- },

  -- Null-ls for integrating external formatters and linters
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  -- Auto tag closing for HTML, XML, etc.
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Comment.nvim for easy commenting
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      return require "configs.comment"
    end,
  },

  {
    "folke/lazydev.nvim",
    event = "VeryLazy",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        {
          path = "nvim-lspconfig",
        },
      },
    },
  },
}
