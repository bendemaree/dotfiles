" global
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=/Users/Shared/Benjamin/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'sjl/gundo.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'snipmate-snippets'
Bundle 'Jinja'
Bundle 'Haml'
Bundle 'LycosaExplorer'
Bundle 'ScrollColors'
Bundle 'Color-Sampler-Pack'

set ruler
set visualbell
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
set pastetoggle=<F2>

" indentation
set autoindent
set softtabstop=4 shiftwidth=4 expandtab

" visual
colorscheme solarized
set background=dark
set cursorline
set t_Co=256

" syntax highlighting
syntax on
filetype on
filetype plugin indent on

" gundo
nnoremap <F5> :GundoToggle<CR>

" rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" lycosa
set hidden

" powerline
set laststatus=2
set encoding=utf-8
let Powerline_symbols="fancy"

" leader
let mapleader = ","

" sudo
cmap w!! w !sudo tee % >/dev/null
