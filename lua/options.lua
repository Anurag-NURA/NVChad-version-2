require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt

opt.tabstop = 4        -- Number of spaces tabs count for
opt.shiftwidth = 4     -- Size of an indent
opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while performing editing
opt.expandtab = true   -- Use spaces instead of tabs

opt.relativenumber=true -- Show relative line numbers

opt.wrap = true -- Enable line wrapping
opt.linebreak = true -- Break lines at word boundaries
opt.breakindent = true -- Indent wrapped lines
