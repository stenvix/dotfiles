" .vimrc file by Stepanov Valentyn (c) 2016

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
"---------------=== Plugins ===-------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                   " Package manager
Plugin 'vim-airline/vim-airline'                " Airline toolbar
Plugin 'vim-airline/vim-airline-themes'         " Theme for airline toolbar
Plugin 'airblade/vim-gitgutter'                 " Show file changes
Plugin 'tpope/vim-fugitive'                     " Git in Vim
Plugin 'bronson/vim-trailing-whitespace'        " Show and fix trailing-whitespace
Plugin 'kien/ctrlp.vim'                         " Fuzzy finder

"---------=== Code/project navigation ===-------------"
Plugin 'scrooloose/nerdtree'                    " A tree explorer plugin for vim
Plugin 'Xuyuanp/nerdtree-git-plugin'            " A plugin of NERDTree showing git status
"------------------=== Other ===----------------------"
Plugin 'tpope/vim-surround'                     " Parentheses, brackets, quotes, XML tags, and more
"---------------=== Languages support ===-------------"
Plugin 'scrooloose/syntastic'                   " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'                   " Comment stuff out
Plugin 'hdima/python-syntax'		            " Python 3.5 Support
"---------------=== Python === -----------------------"
Plugin 'davidhalter/jedi-vim'                   " Awesome Python autocompletion with VIM
"Plugin 'klen/python-mode'                       " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'                    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'          " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'           " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'              " Virtualenv suppirt
Plugin 'majutsushi/tagbar'                      " Tagbar
"---------------=== Color scheme ===-------------------"
Plugin 'altercation/vim-colors-solarized'       " Solarized color scheme
call vundle#end()

"---------------=== Common Vim settings ===-------------------

" Enable color scheme
colorscheme solarized
set background=dark

" Enable syntax highlighting
syntax enable
let python_highlight_all = 1

" Vim 256 colors
set t_Co=256

" Color columnt
set colorcolumn=100
set textwidth=100
highlight ColorColumn ctermbg=236

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamedplus
" Remap <leader>
let mapleader=","

"Increase undo's level
set undolevels=1000

" Backspase setting
" Set normal deletion"
set backspace=2

" Mouse
set mouse=a

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show line numbers
set number

" Relative numbering
set rnu
" Set tabs to have 4 spaces
set ts=4

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab
set smarttab

" When using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" Show a visual line under the cursor's current line
set cursorline

" Show the matching part of the pair for [] {} and ()
set showmatch

" Folding
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=1

"---------------=== Key binding ===-------------------

" Navigate between split windows quickly
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Toggle NERDtree
nmap <F9> :NERDTreeToggle <CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Delete line in insert mode
imap <c-d> <esc>ddi

" Git diff highlights toggle
nnoremap <F7> :GitGutterLineHighlightsToggle<CR>
map <S-F7> :GitGutterToggle<CR>

" Easier moving between tabs
map <Leader>N <esc>:tabprevious<CR>
map <Leader>M <esc>:tabnext<CR>

" Esier moving between buffers
map <Leader>n <esc>:bprevious<CR>
map <Leader>m <esc>:bnext<CR>

" Clear search highlights
noremap <C-n> :nohl <CR>
vnoremap <C-n> :nohl <CR>
inoremap <C-n> <esc>:nohl<CR>i

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
nmap <leader>q :bp <BAR> bd #<CR>  "Quit buffer

" Quick save
noremap <silent> <C-z> :update<CR>
vnoremap <silent> <C-z> <C-C>:update<CR>
inoremap <silent> <C-z> <C-O>:update<CR>
"---------------=== Plugin specific settings ===-------------------

"Detecting filetype
filetype on
filetype plugin on
filetype plugin indent on

" Airline config
let g:airplane_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_powerline_fonts = 1

" Status line
set laststatus=2
"set nowrap

" NERDTree auto open
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$']
" Python Mode
" let g:pymode_rope = 0

" Documentation
" let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'

"Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8']
" let g:pymode_lint_cwindow = 1
" let g:pymode_lint_ignore="E501,W601,C0110,C0111"
" let g:pymode_lint_write = 0

" Support virtualenv
" let g:pymode_virtualenv = 1

" Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_echo_current_error=1
let g:syntastic_python_checkers=['pylint','flake8']
" Python syntax
let python_highlight_all = 1
"Vim jedy
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first = 1
let g:jedi#usages_command = "<leader>z"
" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
