local opt = vim.opt

opt.termguicolors=true
vim.cmd('colorscheme gruvbox-material')

opt.syntax = 'on'                           -- Enables syntax highlighing
opt.hidden = true                           -- Required to keep multiple buffers open multiple buffers
opt.wrap = false                            -- Display long lines as just one line
opt.encoding = 'utf-8'                      -- The encoding displayed
opt.pumheight = 10                          -- Makes popup menu smaller
opt.fileencoding='utf-8'                    -- The encoding written to file
opt.ruler = true              			    -- Show the cursor position all the time
opt.cmdheight = 2                           -- More space for displaying messages
opt.iskeyword:append('-')                   -- treat dash separated words as a word text object
opt.mouse = ''                              -- Disable the mouse
opt.splitbelow = true                       -- Horizontal splits will automatically be below
opt.splitright = true
opt.conceallevel = 0                        -- So that I can see `` in markdown files
opt.tabstop = 2                             -- Insert 2 spaces for a tab
opt.shiftwidth = 2                          -- Change the number of space characters inserted for indentation
opt.smarttab = true                         -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab = true                        -- Converts tabs to spaces
opt.smartindent = true                      -- Makes indenting smart
opt.autoindent = true                       -- Good auto indent
opt.laststatus = 0                          -- Always display the status line
opt.number = true                           -- Line numbers
opt.cursorline = true                       -- Enable highlighting of the current line
opt.background='dark'                       -- tell vim what the background color looks like
opt.showtabline = 2                         -- Always show tabs
opt.showmode = false                        -- We don't need to see things like -- INSERT -- anymore
opt.backup = false                          -- This is recommended by coc
opt.writebackup = false                     -- This is recommended by coc
opt.updatetime = 300                        -- Faster completion
opt.timeoutlen = 500                        -- By default timeoutlen is 1000 ms
opt.formatoptions:remove('cro')             -- Stop newline continution of comments
opt.clipboard = 'unnamedplus'               -- Copy paste between vim and everything else
opt.completeopt = 'menu,menuone,noselect'   -- Completion for nvim-cmp
opt.signcolumn = 'yes'

