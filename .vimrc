"********************************************************************
" Vim-PLug core
"********************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

autocmd! bufwritepost .vimrc source %
runtime macros/matchit.vim

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
let g:vim_bootstrap_langs = "c,python"
let g:vim_bootstrap_editor = "vim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"********************************************************************
" Plug install packages
"********************************************************************
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tommcdo/vim-exchange'
Plug 'ryanoasis/vim-devicons'
Plug 'ajh17/VimCompletesMe'
Plug 'tmhedberg/SimpylFold'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'derekwyatt/vim-scala'
Plug 'ctrlpvim/ctrlp.vim'

"********************************************************************
" Custom bundles
"********************************************************************

"" c/c++
Plug 'octol/vim-cpp-enhanced-highlight'

""  python
Plug 'python-mode/python-mode'

"" latex
Plug 'lervag/vimtex'

"" markdown
Plug 'suan/vim-instant-markdown'

call plug#end()

" Required:
filetype plugin indent on

"********************************************************************
" Basic Setup
"********************************************************************

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

set fileformats=mac,unix,dos
" Use :e ++ff=dos to hide ^M when editing Windows files on Mac/Unix

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

"********************************************************************
" Visual Settings
"********************************************************************
syntax on
set ruler
set number
set relativenumber

highlight Comment cterm=italic

set mouse=n
set mousemodel=popup
set t_Co=256

colorscheme one
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set background=dark
    set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h16
  endif
else
  " IndentLine
  let g:indentLine_enabled=1
  let g:indentLine_concealcursor=0
  let g:indentLine_char='┆'
  let g:indentLine_faster=1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

if (has("termguicolors"))
  set termguicolors
endif

" I love italic for comments
let g:one_allow_italics=1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=2

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Search mappings:
" show search results in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" vim-airline
let g:airline_theme='one'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tagbar#enabled=1
let g:airline_skip_empty_sections=1
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeHijackNetrw=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.o$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
let g:NERDTreeWinSize=40
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1
let g:NERDTreeSyntaxDisableDefaultExtensions=1
let g:NERDTreeDisableExactMatchHighlight=1
let g:NERDTreeDisablePatternMatchHighlight=1
let g:NERDTreeSyntaxEnabledExtensions=['c', 'h', 'cpp', 'js', 'css', 'py', 'pl', 'tex', 'hs', 'md', 'sh', 'vim', 'ipynb', 'txt']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.o
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"*********************************************************************
" Autocmd Rules
"*********************************************************************

"" do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"********************************************************************
" Mappings
"********************************************************************

"" Split Window (default=horizontal: s(split), vertical: v)
noremap <Leader>s :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
" nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited
"" file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited
"" file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

set grepprg=grep\ -nH\ $*
set sw=2
set iskeyword+=:
let g:tex_flavor='latex'
let g:tex_fold_enabled=1
let g:tex_nospell=1
let g:tex_no_error=1

let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction

nnoremap <leader>c :VimtexCompile<CR>
nnoremap <leader>w :VimtexView<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set pastetoggle=<F5>
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-p> :w !pbcopy<CR><CR>
endif

"" Buffer navigation
noremap <leader>h :bf<CR>
noremap <leader>l :bl<CR>
noremap <leader>j :bn<CR>
noremap <leader>k :bp<CR>

"" Close buffer (or buffer delete)
noremap <leader>d :bd<CR>
"" Close buffer without close window
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Remap keys
" g0 & g$ goto begin and end of display line
" up on display line, while k up on real line
noremap <Up> gk
" down on display line, while j down on real line
noremap <Down> gj

"" Switching windows (normal mode only)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"" Easer moving of code blocks (visual mode)
vnoremap < <gv
vnoremap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*********************************************************************
" Custom configs
"*********************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

"" python-mode
let g:pymode_python='python3'

" fold
let g:pymode_folding=0

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_all=1

" pep8 indents
let g:pymode_indent=1

" vim-airline
let g:airline#extensions#virtualenv#enabled=1

" UltiSnippets
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0
nnoremap <Leader>m :InstantMarkdownPreview<CR>

"*********************************************************************
" Convenience variables
"*********************************************************************

"" Include Pg-Up & Pg-Down in a more easy way
nnoremap <F7> <C-b>
nnoremap <F8> <C-d>
nnoremap <F9> <C-f>

" To format entire buffer/file and return the same line where you were
nnoremap <F6> mzgg=G`z

" Create the 'tags' file (need to install ctags first)
command! MakeTags !ctags -R .
" Now:
"  use <C-]> to jump to tag under cursor
"  use <C-t> to jump back up the tag stack
"  use g<C-]> for ambiguos tag

" Customizing **one** colorscheme for comments
call one#highlight('Comment', 'ade8e4', '', 'italic')
call one#highlight('vimLineComment', 'ade8e4', '', 'italic')

"********************************************************************
" Some plugin's help
"********************************************************************

" Commentary.vim
" gcc to comment a line
" gc<motion>, e.g. gcap to comment a paragraph
" gcgc uncomment

" Fugitive.vim
" :Gstatus == git Status
" - == git add
" :Gedit  == edit a file and write to stage
" :Gcommit == git commit

