" If plugin manager is not present, download and install it
if ! filereadable(system('echo -n "${HOME}/.vim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${HOME}/.vim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${HOME}/.vim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Load in the following packages
call plug#begin('~/.vim/plugins')
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-surround'
Plug 'bignimbus/pop-punk.vim'
call plug#end()
