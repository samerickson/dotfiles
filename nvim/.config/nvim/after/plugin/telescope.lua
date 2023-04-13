-- Telescope remappings
local opts = { noremap = true }

vim.keymap.set('', '<C-p>', ':Telescope git_files<CR>', opts)
vim.keymap.set('', '<A-p>', ':Telescope quickfix<CR>', opts)
vim.keymap.set('', '<C-t>', ':Telescope find_files<CR>', opts)
vim.keymap.set('', '<C-f>', ':Telescope live_grep<CR>', opts)
vim.keymap.set('', '<A-t>', ':Telescope vim_options<CR>', opts)
vim.keymap.set('', '<A-p>', ':Telescope commands<CR>', opts)
vim.keymap.set('', '<C-b>', ':Telescope buffers<CR>', opts)

