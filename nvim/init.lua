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
-- fzf-lua
map('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<CR>",{ noremap = true, silent = true })
--[[
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>td :lua require('theprimeagen.telescope').dev()<CR>
--]]