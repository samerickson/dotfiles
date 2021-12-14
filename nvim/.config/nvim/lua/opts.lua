-- opts.lua

local tabSize = 4

local set = vim.opt

set.tabstop = tabSize
set.shiftwidth = tabSize
set.softtabstop = tabSize
set.expandtab = false
set.swapfile = false

set.listchars = {tab = '▸ ', trail = '·'}
