-- keymap.lua

local key = require("map")

vim.g.mapleader = ',' -- change the <leader> key to be comma

local opts = { noremap = true, silent = true }

key.map('i', 'jk', '<Esc>', opts)
key.map('n', '<leader>x', ':Explore<CR>', opts);

-- Editing
key.map('n', '<C-Z>', ':redo', opts)

-- BUFFERS
key.map('n', '<leader>t', ':bn <CR>', opts)
key.map('n', '<leader>g', ':bp <CR>', opts)

-- REGEX replace
key.map('n', 'R', ':%s//g<Left><Left>', opts)

-- Show/hide whitespace characters
key.map('n', '<leader>l', ':set list!<CR>', opts)

-- Show/hide line numbers
key.map('n', '<leader>n', ':set number!<CR>', opts)
key.map('n', '<leader>m', ':set relativenumber!<CR>', opts)

-- Generate documentation
key.map('n', '<leader>d', ':lua require("neogen").generate()<CR>', opts)

-- Highlight lines over 80 characters
key.map('n', '<leader>g', ':match Error /\\%>80c/<CR>', opts)
key.map('n', '<leader>h', ':match Text /\\%>80c/<CR>', opts)

-- Terminal mode bindings
key.map('n', '<C-v>', ':terminal<CR>', opts)
key.map('i', '<C-v>', ':terminal<CR>', opts)
key.map('t', '<C-d>', '<C-\\><C-n>', opts)
key.map('t', '<Esc>', '<C-\\><C-n>', opts)
key.map('t', 'jk', '<C-\\><C-n>', opts)

-- Telescope
key.map('n', '<C-p>', ':lua require("telescope.builtin").git_files()<CR>', opts)
key.map('i', '<C-p>', ':lua require("telescope.builtin").git_files()<CR>')
key.map('n', '<C-b>', ':lua require("telescope.builtin").buffers()<CR>')
key.map('i', '<C-b>', ':lua require("telescope.builtin").buffers()<CR>')
key.map('n', '<C-o>', ':lua require("telescope.builtin").find_files()<CR>')
key.map('i', '<C-o>', ':lua require("telescope.builtin").find_files()<CR>')
key.map('i', '<C-t>', ':lua require("telescope.builtin").live_grep()<CR>')
key.map('n', '<C-t>', ':lua require("telescope.builtin").live_grep()<CR>')
key.map('i', '<C-h>', ':lua require("telescope.builtin").help_tags()<CR>')
key.map('n', '<C-h>', ':lua require("telescope.builtin").help_tags()<CR>')
key.map('i', '<C-a>', ':lua require("telescope.builtin").commands()<CR>')
key.map('n', '<C-a>', ':lua require("telescope.builtin").commands()<CR>')
key.map('i', '<C-k>', ':lua require("telescope.builtin").keymaps()<CR>')
key.map('n', '<C-k>', ':lua require("telescope.builtin").keymaps()<CR>')

-- LSP
key.map('n', '<Leader>k', ':lua vim.lsp.buf.hover()<CR>', opts)
key.map('n', '<F12>', ':lua vim.lsp.buf.definition()<CR>', opts)
key.map('n', '<S-F12>', ':lua vim.lsp.buf.references()<CR>', opts)
key.map('n', '<C-F12>', ':lua vim.lsp.buf.implementation()<CR>', opts)
key.map('n', '<C-r><C-r>', ':lua vim.lsp.buf.rename()<CR>', opts)
key.map('n', 'C-.>', ':lua vim.lsp.buf.code_action()<CR>', opts)
key.map('n', '<C-n>', ':lua vim.diagnostic.goto_next()<CR>', opts)
key.map('n', '<C-m>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
key.map('n', '<F8>', '[[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]]', opts)
