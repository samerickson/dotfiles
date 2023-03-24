-- Telescope remappings
local builtin = require('telescope.builtin')
local opts = { noremap = true }

vim.keymap.set('', '<C-p>', builtin.git_files, opts)
vim.keymap.set('', '<A-p>', builtin.quickfix, opts)
vim.keymap.set('', '<C-o>', builtin.find_files, opts)
vim.keymap.set('', '<C-t>', builtin.live_grep, opts)
vim.keymap.set('', '<A-t>', builtin.vim_options, opts)
vim.keymap.set('', '<C-b>', builtin.buffers, opts)

