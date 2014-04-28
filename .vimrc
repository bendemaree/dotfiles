" Basic bootstrap for package manager
set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Package manager
NeoBundleFetch 'Shougo/neobundle.vim'

" Packages
NeoBundle 'altercation/vim-colors-solarized'    " Color scheme
NeoBundle 'bling/vim-airline'                   " Very fancy statusline
" NeoBundle 'bling/vim-bufferline'                " Basic buffer listing
NeoBundle 'dahu/vim-fanfingtastic'              " Multiline character search
NeoBundle 'fatih/vim-go'                        " All-in-one go utilities
NeoBundle 'jpalardy/vim-slime'                  " Redirect from vim to tmux
NeoBundle 'kien/ctrlp.vim'                      " Fuzzy finder
NeoBundle 'majutsushi/tagbar'                   " Source file navigator
NeoBundle 'nathanaelkane/vim-indent-guides'     " Visual indent levels
NeoBundle 'scrooloose/syntastic'                " Syntax error utilities
NeoBundle 'shougo/neocomplete.vim'              " Autocomplete including paths
NeoBundle 'shougo/neosnippet.vim'               " Snippet support
NeoBundle 'shougo/neosnippet-snippets'          " Snippet library
NeoBundle 'terryma/vim-multiple-cursors'        " Multiple cursor support
NeoBundle 'terryma/vim-expand-region'           " Grow a visual selection
NeoBundle 'tomtom/tcomment_vim'                 " Commenting addons

" Restore file position on reopen
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Strip trailing whitespace
au BufWritePre * :%s/\s\+$//e

" Setup color scheme
syntax enable
set background=dark
colorscheme solarized

" Setup syntax highlighting
filetype on
filetype plugin indent on

" Set leader key
let mapleader=","

" Builtin settings
set cursorline                                      " Enable horizontal line where cursor is
set ruler                                           " Enable column and row counter in footer
set visualbell                                      " Enable flashing error bells
set number                                          " Enable line numbers
set hlsearch                                        " Enable highlighting matches when searching
set incsearch                                       " Enable refining search while typing
set mouse=a                                         " Enable mouse support
set mousehide                                       " Disable mouse when characters are typed
set ignorecase                                      " Enable case ignore for smart casing
set smartcase                                       " Enable smart case for searching and substitution
set history=10000                                   " Enable a larger history
set undolevels=10000                                " Enable a larger undo history
set ttyfast                                         " Enable an explicitly fast connection
set showmatch                                       " Enable highlighting matching pairs
set noswapfile                                      " Disable swap file
set autoindent                                      " Enable matching indent on new lines
set copyindent                                      " Enable matching existing indent when autoindenting
set shiftround                                      " Enable shiftwidth setting for indenting blocks
set smarttab                                        " Enable smart tabs
set expandtab                                       " Enable expanding tabs into spaces
set tabstop=4                                       " Enable proper number of columns per tab
set shiftwidth=4                                    " Enable proper indent level with reindent
set pastetoggle=<leader>p                           " Enable toggling paste mode
set list                                            " Enable displaying whitespace characters
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮  " Enable specific whitespace characters
set linebreak                                       " Enable displaying linebreaks
set showbreak=↪\                                    " Enable a special character for linebreaks
set scrolloff=1                                     " Enable a minimum number of visiable lines while scrolling
set scrolljump=1                                    " Enable a number of lines to jump when scrolling
set display+=lastline                               " Enable showing the maximum amount of the last line

" Key mappings
map <up> <nop>                                      " Disable up key
map <down> <nop>                                    " Disable down key
map <left> <nop>                                    " Disable left key
map <right> <nop>                                   " Disable right key
nnoremap ; :                                        " Save some shift key presses
nnoremap ] :lnext<CR>                               " Jump to next
nnoremap [ :lprev<CR>                               " Jump to previous
nnoremap <Leader>1 :b1<CR>                          " Jump to buffer 1
nnoremap <Leader>2 :b2<CR>                          " Jump to buffer 2
nnoremap <Leader>3 :b3<CR>                          " Jump to buffer 3
nnoremap <Leader>4 :b4<CR>                          " Jump to buffer 4
vnoremap < <gv                                      " Reselect visual block after indent
vnoremap > >gv                                      " Reselect visual block after indent
cmap w!! w !sudo tee % >/dev/null                   " Enable sudo shortcut

" Setup clipboard on Mac
if exists('$TMUX')
	set clipboard=
else
	set clipboard=unnamed
endif

" vim-slime setup
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "0"}

" vim-indent-guides setup
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=3

" syntastic setup
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_always_populate_loc_list = 1

" neocomplete setup
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>    neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>     neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>    neocomplete#close_popup()
inoremap <expr><C-e>    neocomplete#cancel_popup()

" neosnippet setup
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" vim-go setup
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
let g:go_snippet_engine = "neosnippet"

" tagbar setup
nmap <leader>g :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" airline setup
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" ctrlp setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" Prompt for uninstalled bundles
NeoBundleCheck
