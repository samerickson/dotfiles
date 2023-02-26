local tabSize = 4
local set = vim.opt

set.clipboard = "unnamed"

set.relativenumber = true
set.number = true
set.shell = "pwsh"
set.shellcmdflag="-command"

set.shellquote="\""
set.shellxquote=""

set.tabstop = tabSize
set.shiftwidth = tabSize
set.softtabstop = tabSize
set.expandtab = true
set.swapfile = false
set.list = true

set.scrolloff = 10
set.numberwidth = 5

-- Have gutter be used even if line number are not being displayed
set.signcolumn = "yes"

set.updatetime = 1000
set.cmdheight = 1

set.listchars = {tab='» ', extends='⟩', precedes='⟨', trail='•'}

-- Always open help files in a left vertical pane
vim.api.nvim_exec(
    [[augroup helpfiles
    au!
    au BufRead,BufEnter */doc/* wincmd L
    augroup END]],
    false)

