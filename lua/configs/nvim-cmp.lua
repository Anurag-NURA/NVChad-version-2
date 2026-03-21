-- lua/configs/nvim-cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

local mapping = cmp.mapping.preset.insert({
    -- disable tab, but still allow <S-Tab> to move backward
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
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
        { name = "nvim_lsp" },   -- 🔥 keep clean (priority handled in sorting)
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer", keywords_length = 5 },

        -- 👇 push this LAST
        { name = "nvim_lua" },
    },

    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,

            -- 🔥 FORCE LSP ON TOP
            function(entry1, entry2)
                if entry1.source.name == "nvim_lsp" and entry2.source.name ~= "nvim_lsp" then
                    return true
                elseif entry2.source.name == "nvim_lsp" and entry1.source.name ~= "nvim_lsp" then
                    return false
                end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

    experimental = {
        ghost_text = true,
    },
}
