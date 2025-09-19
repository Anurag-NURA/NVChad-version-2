-- lua/configs/nvim-cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

local mapping = cmp.mapping.preset.insert({
    -- disable tab, but still allow <S-Tab> to move backward
    ['<C-Space'] = cmp.mapping.confirm({select = true}),
    ['<S-Tab>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = function(fallback)
          fallback() -- normal Tab (indent)
    end
})

return {
    mapping = mapping,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "cmdline" },
    },
    experimental = {
        ghost_text = true,
    },
}

