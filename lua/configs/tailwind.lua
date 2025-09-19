return{
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          on_attach = require("nvchad.lsp").on_attach,
          on_init = require("nvchad.lsp").on_init,
          capabilities = require("nvchad.lsp").capabilities,
          filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "astro" },
        },
      }
    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup({
        filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "astro" },
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  },
}
