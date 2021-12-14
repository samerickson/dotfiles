-- keymap.lua

local key = require("map")

vim.g.mapleader = ',' -- change the <leader> key to be comma

key.map('i', 'jk', '<Esc>', {noremap=true}) -- Map jk to <Esc>

-- BUFFERS
key.map('n', '<leader>df', ':bn <CR>', {noremap=true})
key.map('n', '<leader>fd', ':bp <CR>', {noremap=true})

-- REGEX replace
key.map('n', 'R', ':%s//g<Left><Left>', {noremap=true})

-- Show/hide whitespace characters
key.map('n', '<leader>l', ':set list!<CR>', {noremap=true})

-- Show/hide line numbers
key.map('n', '<leader>n', ':set number!<CR>', {noremap=true})
key.map('n', '<leader>m', ':set relativenumber!<CR>', {noremap=true})

-- Generate documentation
key.map('n', '<leader>d', ':lua require("neogen").generate()<CR>', {noremap=true})

-- Highlight lines over 80 characters
key.map('n', '<leader>g', ':match Error /\\%>80c/<CR>', {noremap=true})
key.map('n', '<leader>h', ':match Text /\\%>80c/<CR>',{noremap=true})

-- Telescope
key.map('n', '<C-p>', ':lua require("telescope.builtin").find_files()<CR>')
key.map('i', '<C-p>', ':lua require("telescope.builtin").find_files()<CR>')
