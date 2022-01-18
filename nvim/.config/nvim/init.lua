-- init.lua

-- Load in desired sub-modules
require("plugins")
require("keymap")
require("keybr")
require("opts")
require("colors")
require("alpha-config")

vim.cmd [[
	augroup highlight_yank
		autocmd!
		autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
	augroup END
]]
