require("lint").linter_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  javascriptreact = { "eslint" },
  typescriptreact = { "eslint" },
  html = { "htmlhint" },
  css = { "stylelint" },
  scss = { "stylelint" },
  json = { "jsonlint" },
  lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
