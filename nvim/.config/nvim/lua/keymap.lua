-- keymap.lua

-- Set config location by XDG_CONFIG_HOME by default
local config = os.getenv('XDG_CONFIG_HOME') or os.getenv('HOME') .. '/.config'

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

-- Go to next buffer using <leader>df
map('n', '<leader>df', ':bn <CR>', {noremap=true})

-- Go to previous buffer using <leader>fd
map('n', '<leader>fd', ':bp <CR>', {noremap=true})

-- REGEX replace
map('n', 'R', ':%s//g<Left><Left>', {noremap=true})

-- Show/hide whitespace characters
map('n', '<leader>l', ':set list!<CR>', {noremap=true})

-- Show/hide line numbers
map('n', '<leader>n', ':set number!<CR>', {noremap=true})
map('n', '<leader>m', ':set relativenumber!<CR>', {noremap=true})

-- Highlight lines over 80 characters
map('n', '<leader>g', ':match Error /\\%>80c/<CR>', {noremap=true})
map('n', '<leader>h', ':match Error /\\%>80c/<CR>',{noremap=true})

-- Quick open frequent files
map('n', '<leader>ea', ':e ' .. config .. '/shell/aliases <CR>')
map('n', '<leader>ev', ':e ' .. config .. '/nvim/init.lua <CR>')
map('n', '<leader>enk', ':e ' ..config .. '/nvim/lua/keymap.lua <CR>')
map('n', '<leader>enp', ':e ' .. config .. '/nvim/lua/plugins.lua <CR>')

