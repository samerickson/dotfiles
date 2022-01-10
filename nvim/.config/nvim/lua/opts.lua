-- opts.lua

local tabSize = 4

local set = vim.opt

set.tabstop = tabSize
set.shiftwidth = tabSize
set.softtabstop = tabSize
set.expandtab = true
set.swapfile = false
set.list = true
set.numberwidth = 5

set.listchars = {tab='» ', extends='⟩', precedes='⟨', trail='•'}
