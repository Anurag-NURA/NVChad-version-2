local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
-- prettier formatting is handled by conform.nvim
    null_ls.builtins.formatting.stylua.with {
      extra_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    },
  },
}

return opts
