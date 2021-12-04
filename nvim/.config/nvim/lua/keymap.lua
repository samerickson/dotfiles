-- keymap.lua

-- Map method to handle the different kinds of key maps
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

vim.g.mapleader = ',' -- change the <leader> key to be comma

-- Keymappings
map('i', 'jk', '<Esc>', {noremap=true}) -- Map jk to <Esc>
map('n', '<leader>df', ':bn <CR>', {noremap=true}) -- Go to next buffer using <leader>df
map('n', '<leader>fd', ':bp <CR>', {noremap=true}) -- Go to previous buffer using <leader>fd

-- Quick open frequent files
map('n', '<leader>ea', ':e ~/.config/shell/aliases <CR>')
map('n', '<leader>enk', ':e ~/.config/nvim/lua/keymap.lua <CR>')
map('n', '<leader>enp', ':e ~/.config/nvim/lua/plugins.lua <CR>')

