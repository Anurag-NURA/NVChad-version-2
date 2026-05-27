# ⚡ NVChad v2.5 User Configuration

> **Custom [NvChad](https://github.com/NvChad/NvChad) config for modern Neovim, extending the power of NvChad v2.5.**

---

## 1. Project Overview

This repository is a personal Neovim configuration built on top of [NvChad v2.5](https://github.com/NvChad/NvChad). NvChad itself loads as a plugin, and all extended configurations and plugins live here.

**Key features:**
- 🌐 Language Server Protocol (LSP) support for 7+ languages
- 🔥 Autocompletion (nvim-cmp) with snippets
- 🎨 Auto-formatting and linting (conform, null-ls, nvim-lint)
- 🐞 Debugging with nvim-dap and nvim-dap-go
- 💡 Extensive plugin ecosystem optimized via lazy.nvim

---

## 2. Quick Start

**Prerequisites**
- [Neovim](https://neovim.io/) ≥ 0.9
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (for language tooling)

**Installation**
```sh
git clone https://github.com/Anurag-NURA/NVChad-version-2 ~/.config/nvim
nvim
```

On first launch, NvChad and all plugins will install automatically (using [lazy.nvim](https://github.com/folke/lazy.nvim)).

**Verification**
- Run `:Mason` to check tool installation
- Run `:LspInfo` to verify LSP clients are attached
- Edit a `.js`, `.go`, `.py`, or `.lua` file; confirm completion/linting/formatting works

---

## 3. Directory Structure Overview

```text
.
├── lua/
│   ├── configs/      # Plugin and feature configs (LSP, cmp, etc.)
│   ├── plugins/      # Plugin definitions/imports
│   ├── chadrc.lua    # Ui and navigation config
│   ├── mappings.lua  # Keymappings
│   └── options.lua   # Neovim options
├── init.lua          # Main entry, loads lazy.nvim and NvChad
├── lazy-lock.json    # Plugin version lockfile
└── ...               # Additional files and folders
```

---

## 4. Configuration Files Reference ⭐

<details>
<summary><strong>lua/configs/lspconfig.lua</strong> (138 lines)</summary>

- 7+ LSP servers: `bashls`, `cssls`, `dockerls`, `html`, `jsonls`, `rust_analyzer`, `yamlls`
- **Tailwind CSS**: React/Vue/Svelte/Astro support, linting, validation
- **TypeScript**: Formatting disabled (use Prettier)
- **Python**: Strict mode via pyright
- **C/C++**: Background indexing, clang-tidy
- **Go**: gofumpt, imports, staticcheck
- Custom `on_attach` callback for omnifunc and completion
</details>

<details>
<summary><strong>nvim-cmp.lua</strong> (59 lines)</summary>

- Configures completion sources: LSP, LuaSnip, path, buffer, nvim_lua
- Key mappings: Ctrl-Space (confirm), Shift-Tab (select)
- Snippet integration and ghost text
</details>

<details>
<summary><strong>conform.lua</strong> (22 lines)</summary>

- Format-on-save with 500ms timeout
- Per-language formatters:
    - Lua: stylua
    - CSS/HTML/JSON: prettier
    - JS/TS: prettierd
    - Python: black
- LSP fallback if no formatter
</details>

<details>
<summary><strong>treesitter.lua</strong> (30 lines)</summary>

- Parsers: Vim, Lua, HTML, CSS, TS, JS, C, C++, JSON, Astro, Markdown, Go
- Syntax highlight and indentation enabled
</details>

<details>
<summary><strong>lint.lua</strong> (17 lines)</summary>

- Linters: ESLint, HTMLHint, StyleLint, JsonLint, LuaCheck
- Auto lints on save
</details>

<details>
<summary><strong>lazy.lua</strong> (47 lines)</summary>

- lazy.nvim manager config
- Default lazy loading on
- Sets NvChad color scheme
- Disables 20+ built-in Vim plugins for performance
</details>

<details>
<summary><strong>null-ls.lua</strong> (19 lines)</summary>

- Extra formatters/linters: gofumpt, goimports, stylua
</details>

<details>
<summary><strong>cmp-cmdline.lua</strong> (24 lines)</summary>

- Command-line completion for `/`, `:`
- Buffer, path, and command completions
</details>

<details>
<summary><strong>comment.lua</strong> (11 lines)</summary>

- Setup for Comment.nvim with mappings `gcc`, `gc`, etc.
</details>

<details>
<summary><strong>tailwind.lua</strong> (26 lines)</summary>

- Tailwind LSP integration
- Colorizer plugin for color preview
- Supported: HTML, CSS, JS, TS, JSX, TSX, Vue, Svelte, Astro
</details>

---

## 5. Root Configuration Files

**init.lua**
- Bootstraps lazy.nvim if missing
- Loads NvChad from branch v2.5
- Imports custom plugins and configs

**chadrc.lua**
- UI customization: rosepine theme, italic comments
- Nvdash enabled on startup
- Minimal tabufline & statusline
- Completion: atom_colored with left icons
- Mason tools pre-installed for JS, TS, CSS, Prettier, Lua, ESLint, HTML

**options.lua**
- Extends NvChad options: 2-space tabs, relative numbers, line wrap, system clipboard

**mappings.lua**
- NvChad extended: `; → :`, `jk → <ESC>`, `<leader>tt` (toggle transparency), `<leader>db` (DAP breakpoint)

**lazy-lock.json**
- Locks plugin versions; commit to version control

---

## 6. Plugins Used

- **nvim-cmp** — Completion engine
- **conform.nvim** — Fast async formatting
- **nvim-lspconfig** — LSP setup
- **nvim-treesitter** — Treesitter highlighting
- **nvim-lint** — General linting
- **nvim-dap**, **nvim-dap-go** — Debuggers
- **copilot.vim** — GitHub Copilot AI
- **none-ls.nvim** — Ext. formatters/linters
- **nvim-ts-autotag** — Auto-close tags
- **Comment.nvim** — Easy commenting
- **lazydev.nvim** — Lua dev helper
- *(see lazy.lua/plugin files for full list and options)*

---

## 7. Customization Guide

**Add a plugin:**
```lua
{
  "author/plugin-name",
  event = "VeryLazy",
  opts = require "configs.my-plugin",  -- Optional config
  config = function()
    -- Custom setup
  end,
}
```
- Place config in `lua/configs/my-plugin.lua`, return options table.

**Modify LSP servers:**  
Edit `lua/configs/lspconfig.lua` (use `on_attach`, `on_init`, `capabilities` as shown).

**Custom formatters/linters:**  
- `lua/configs/conform.lua` (for most)
- `lua/configs/null-ls.lua` (for others)

**Add keymaps:**  
Append new maps in `lua/mappings.lua`.

**Change themes/UI:**  
Tweak `lua/chadrc.lua`.

---

## 8. Supported Languages & Tools

| Language   | LSP           | Linter       | Formatter   | Debugger       |
|------------|---------------|--------------|-------------|---------------|
| Lua        | sumneko_lua   | luacheck     | stylua      | n/a           |
| JS/TS      | tsserver      | eslint       | prettierd   | nvim-dap      |
| CSS        | cssls         | stylelint    | prettier    | n/a           |
| HTML       | html          | htmlhint     | prettier    | n/a           |
| JSON       | jsonls        | jsonlint     | prettier    | n/a           |
| Python     | pyright       | flake8/pylint| black       | nvim-dap      |
| Go         | gopls         | golangci-lint| gofumpt     | nvim-dap-go   |
| Rust       | rust_analyzer | clippy       | rustfmt     | nvim-dap      |
| Tailwind   | tailwindcss   | n/a          | n/a         | n/a           |

---

## 9. Troubleshooting & Maintenance

- Rebuild Treesitter: `:TSUpdate`
- Clear plugin cache: `:NvChadClean`
- Update all plugins: `:Lazy update`
- Check LSP status: `:LspInfo`
- Check Mason tools: `:Mason`

---

## 10. Credits & Resources

- [NvChad](https://github.com/NvChad/NvChad)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [LazyVim](https://github.com/LazyVim/starter) (inspiration)
- Key plugins: listed above

---

> _Happy hacking! PRs and suggestions welcome. For bugs, use [NvChad Discussions](https://github.com/NvChad/NvChad/discussions)._
