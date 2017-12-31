set nocompatible

autocmd! bufwritepost .vimrc source %

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tommcdo/vim-exchange'
call plug#end()

let g:airline#extensions#tabline#enabled=1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod=':t' " Show just the filename
let g:airline_theme='one'
colorscheme one 
if has('gui') && has('gui_running')
	set background=dark
	set guifont=Monaco:h14
endif

if (has("termguicolors"))
    set termguicolors
endif
let g:one_allow_italics=1						 " I love italic for comments

let g:pymode_python='python3'
let g:pymode_folding=0

let g:NERDTreeHijackNetrw=1
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeFind<CR>

" close buffer
nmap <F5> :bclose<CR>			
" new empty buffer
nmap <F6> :enew<CR>				
" move to first buffer
nmap <F7> :bfirst<CR>			
" move to next buffer
nmap <F8> :bnext<CR>			
" move to last buffer
nmap <F9> :blast<CR>			

syntax on 						" turn on syntax highlighting
highlight Comment cterm=italic

set number						" line numbers on
set backspace=indent,eol,start	" Allow backspace in insert mode
set tabstop=4
set autoindent
set cursorline
set showmatch
set enc=utf-8
set nobackup
set noswapfile
set clipboard=unnamed			" Use yank & put with clipboard
set incsearch					" Use incremental search
set nohlsearch					" Don't highlight the strings found in search
set nrformats=					" I don't use octal numbers, the Vim default
set scrolloff=2 				" Keep 2 lines below and above the cursor

" Remap keys
" g0 & g$ goto begin and end of display line
" up on display line, while k up on real line
noremap <Up> gk
" down on display line, while j down on real line
noremap <Down> gj
" move to left-window, normally NERDTree
map <C-h> <C-w>h
" focus the window to the down
map <C-j> <C-w>j
" focus the window to the up
map <C-k> <C-w>k
" move to right-window
map <C-l> <C-w>l

" Customizing **one** colorscheme for comments
call one#highlight('Comment', 'ade8e4', '', 'italic')
call one#highlight('vimLineComment', 'ade8e4', '', 'italic')
