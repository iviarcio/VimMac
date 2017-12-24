set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

let g:airline_theme='one'
colorscheme one 
if has('gui') && has('gui_running')
	set background=dark
	set guifont=Monaco:h14
endif

highlight Comment cterm=italic

set number
set tabstop=4
set autoindent
set cursorline
set showmatch
set enc=utf-8
set nobackup
set noswapfile
set clipboard=unnamed
set incsearch
set hlsearch
