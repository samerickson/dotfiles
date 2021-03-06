call plug#begin('~/.config/nvim/plugins')
    Plug 'scrooloose/nerdtree'
    Plug 'jacoborus/tender.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-surround'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'nanotech/jellybeans.vim'
    Plug 'bignimbus/pop-punk.vim'
call plug#end()

" Some basics:
    set exrc
    set spell
    set vb t_vb=
    set nohlsearch
    set undodir=~/.vim/undodir
    set undofile
    set clipboard=unnamedplus
    let mapleader =","
    set nocompatible nohlsearch
    filetype plugin on
    syntax on
    set listchars=tab:»\ ,extends:⟩,precedes:⟨,space:·,trail:•
    set sw=4 sts=4 ts=4 noet expandtab
    set splitbelow splitright
    set history=1000 undolevels=1000
    set notimeout ttimeout
    set scrolloff=10
    set list
    set t_Co=256
    set noswapfile
    set noerrorbells
    set wildmode=longest,list,full

" HIGHLIGHT SETTINGS AND COLOR SCHEMES:
    " Add Highlight to any line that exceeds 80 characters
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/

    " Color scheme jellybeans
    colorscheme pop-punk

    " Change cursor settings
    highlight Cursor guibg=green guifg=white

    " Change the color of white space characters to me darker
    highlight NonText ctermfg=8

    " Fix comment highlighting for terminal not supporting italics
    highlight Comment cterm=none

    " Set background transparent
    hi Normal guifg=#44cc44 guibg=NONE ctermbg=none

" BUFFER COMMANDS:
" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Special markdown and wiki file settings
    autocmd BufRead,BufNewFile *.md,*.wiki setlocal textwidth=79 spell

" Special settings for yaml files
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" PERSONAL SHORTCUTS AND KEY MAPPINGS:
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
    nnoremap ,ev :e ~/.config/nvim/init.
    nnoremap ,eb :e ~/.bashrc

" AUTOCOMMANDS:
" Changes for specific files types
    autocmd filetype php        set filetype=html
    autocmd filetype html,xml   set shiftwidth=2 tabstop=2 smartindent
    autocmd filetype vimwiki    set filetype=markdown
    autocmd filetype make       set noexpandtab
