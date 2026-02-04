local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "eslint" },
    javascriptreact = { "eslint" },
    typescript = { "eslint" },
    typescriptreact = { "eslint" },
    json = { "prettier" },
    python = { "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    enable = true,
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
