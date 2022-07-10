-- NVIM Keymappings
local map = require('utils').map    -- Import map() helper function
vim.g.mapleader = '<Space>'         -- set Space as the leader key
--- Keymappings ---
map('c','w!!','w !sudo tee %')    -- Allow saving of files as sudo when I forget to start nvim using sudo
--**Documentation needed**
-- vim-surround (ds,cs,yss), vim-repeat (.), comment.nvim (gcc,gc,gl), nvim-cmp, vim-markdown
--**Documentation needed**
-- nvim-tree
map('n', '<leader>t', "<cmd>NvimTreeToggle<CR>")
-- markdownpreview.nvim
map('n', '<leader>y', "<cmd>MarkdownPreviewToggle<CR>")
-- tabular
map('n', '<leader>a=', "<cmd>Tabularize /=<CR>")
map('v', '<leader>a=', "<cmd>Tabularize /=<CR>")
map('n', '<leader>a:', "<cmd>Tabularize /:\zs<CR>")
map('v', '<leader>a:', "<cmd>Tabularize /:\zs<CR>")
-- vim-prettier
map('n', '<leader>P', "<cmd>Prettier<CR>")
-- fzf-lua
map('n', '<C-f>', "<cmd>lua require('fzf-lua').files()<CR>",{silent = true, noremap = true})
map('n', '<C-F>', "<cmd>lua require('fzf-lua').git_files()<CR>",{silent = true, noremap = true})
map('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>",{silent = true, noremap = true})
map('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>",{silent = true, noremap = true})
map('n', '<leader>hh', "<cmd>lua require('fzf-lua').oldfiles()<CR>",{silent = true, noremap = true})
map('n', '<leader>h:', "<cmd>lua require('fzf-lua').command_history()<CR>",{silent = true, noremap = true})
map('n', '<leader>h/', "<cmd>lua require('fzf-lua').search_history()<CR>",{silent = true, noremap = true})
map('n', '<leader>H', "<cmd>lua require('fzf-lua').help_tags()<CR>",{silent = true, noremap = true})
map('n', '<leader>f', "<cmd>lua require('fzf-lua').grep()<CR>",{silent = true, noremap = true})
map('n', '<leader>F', "<cmd>lua require('fzf-lua').grep_cword()<CR>",{silent = true, noremap = true})
--[[
    -- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>",{silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",{silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",{silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",{silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",{silent = true, noremap = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>",{silent = true, noremap = true})
]]--