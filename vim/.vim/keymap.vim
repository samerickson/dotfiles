" Shortcuts to frequently toggled settings
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>m :set number!<CR>
nnoremap <leader>n :set relativenumber!<CR>

" Shortcuts to frequently used functions
nnoremap S :%s//g<Left><Left>

" Exit insert using ctrl
inoremap jk <Esc>

" Better navigation of split windows
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

" Change movements will wrapped and long lines
map j gj
map k gk

" Use ctrl+l to correct spelling on the fly
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Vim settings for using buffers
nnoremap ,ev :e ~/.vim/vimrc
nnoremap ,eb :e ~/.bashrc

