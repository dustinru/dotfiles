-- NVIM Settings
require('options')
-- NVIM Plugins + Config
require('plugins')
require('plugin-config')

-- NVIM Keymappings
-- Import map() helper function
local map = require('utils').map
--- Keymappings ---
vim.g.mapleader = '<Space>'   -- set Space as the leader key
map('c','w!!','w !sudo tee %')    -- Allow saving of files as sudo when I forget to start nvim using sudo
-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>",{silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",{silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",{silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",{silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",{silent = true, noremap = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>",{silent = true, noremap = true})
-- Telescope.nvim