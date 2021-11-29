" Change settings based off filetype
autocmd filetype php        set filetype=html
autocmd filetype html,xml   set shiftwidth=2 tabstop=2 smartindent
autocmd filetype vimwiki    set filetype=markdown
autocmd filetype make       set noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Ensure yaml files are read correctly
autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
