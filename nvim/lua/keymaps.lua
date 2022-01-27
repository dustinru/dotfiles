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
-- fzf-lua
map('n', '<C-f>', "<cmd>lua require('fzf-lua').files()<CR>",{silent = true, noremap = true})
map('n', '<C-F>', "<cmd>lua require('fzf-lua').git_files()<CR>",{silent = true, noremap = true})
map('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>",{silent = true, noremap = true})
map('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>",{silent = true, noremap = true})
map('n', '<Leader>hh', "<cmd>lua require('fzf-lua').oldfiles()<CR>",{silent = true, noremap = true})
map('n', '<Leader>h:', "<cmd>lua require('fzf-lua').command_history()<CR>",{silent = true, noremap = true})
map('n', '<Leader>h/', "<cmd>lua require('fzf-lua').search_history()<CR>",{silent = true, noremap = true})
map('n', '<leader>H', "<cmd>lua require('fzf-lua').help_tags()<CR>",{silent = true, noremap = true})
map('n', '<leader>f', "<cmd>lua require('fzf-lua').grep()<CR>",{silent = true, noremap = true})
map('n', '<leader>F', "<cmd>lua require('fzf-lua').grep_cword()<CR>",{silent = true, noremap = true})
