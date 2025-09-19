-- read :h vim.lsp.config for changing options of lsp servers 

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.lsp"

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "ts_ls", -- typescript
  "yamlls",
}
vim.lsp.enable(servers)

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuration for tailwindcss server
lspconfig.tailwindcss.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
})


-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
