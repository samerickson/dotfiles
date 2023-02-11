vim.g.mapleader = ","

local opts = { noremap = true, silent = true }

vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set('n', '<leader>s', ':%s/', opts)

-- Common editor keybindings
vim.keymap.set('', "<A-UP>", "ddkP", opts)
vim.keymap.set('', "<A-DOWN>", "ddp", opts)
vim.keymap.set('', '<C-a>', "<Esc>ggVG")

-- Terminal mode keybindings
vim.keymap.set('', '<C-g>', ':terminal<CR>', opts)
vim.keymap.set('t', '<C-d>', '<C-\\><C-n>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
vim.keymap.set('t', 'jk', '<C-\\><C-n>', opts)
