require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--this mapping is for Transparency toggler 
map('n', '<leader>tt', require('base46').toggle_transparency, { desc = 'Toggle transparency' })
