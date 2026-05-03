local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.prettier.with {
      extra_args = {
        "--tab-width",
        "2",
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "markdown",
        "text",
      },
    },
    null_ls.builtins.formatting.stylua.with {
      extra_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    },
  },

  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
