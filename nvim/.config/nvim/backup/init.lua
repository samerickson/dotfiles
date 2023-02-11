-- init.lua

-- Load in desired sub-modules
require("plugins")
require("keymap")
require("opts")
require("colors")

vim.cmd [[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
    augroup END

    autocmd BufWritePre *.py :%s/\s\+$//e
    au BufRead,BufNewFile *.md setlocal textwidth=80
    au BufRead,BufNewFile *.tex setlocal textwidth=80 filetype=tex
]]

