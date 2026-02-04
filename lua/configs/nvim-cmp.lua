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
        { name = "nvim_lsp", priority = 1000 },
        { name = "path",  priority = 500 },
        { name = "luasnip", priority = 750 },
        { name = "buffer" , priority = 250, keywords_length = 5 },
        { name = "nvim_lua", priority = 500 },
        { name = "cmdline" },
    },
    experimental = {
        ghost_text = true,
    },
}

