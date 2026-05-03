-- read :h vim.lsp.config for changing options of lsp servers

--require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.lsp"

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "rust_analyzer",
  "yamlls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

-- configuration for tailwindcss server
vim.lsp.config("tailwindcss", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    tailwindcss = {
      filetype = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
      },
      -- 1. Ensure it knows about common React/JS file types
      includeLanguages = {
        javascript = "html",
        javascriptreact = "html",
        typescript = "html",
        typescriptreact = "html",
        vue = "html",
        svelte = "html",
      },
      -- 2. Configuration for linting (optional, but good practice)
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      -- 3. Validation
      validate = true,
    },
  },
})
vim.lsp.enable "tailwindcss"

--configuring single server, example: typescript
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable "ts_ls"

-- configuration for pyright server
vim.lsp.config("pyright", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
vim.lsp.enable "pyright"

-- configuration for clangd server
vim.lsp.config("clangd", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
  filetypes = { "c", "cpp", "c++" },
})
vim.lsp.enable "clangd"

vim.lsp.config("gopls", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      analyses = {
        completeUnimported = true,
        usePlaceholders = true,
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable "gopls"

--end
