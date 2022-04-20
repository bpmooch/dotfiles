" General
set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax on
set termguicolors
let mapleader=","
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

" Theme
Plugin 'dracula/vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'morhetz/gruvbox'

" Rust
Plugin 'rust-lang/rust.vim'

" Go
Plugin 'fatih/vim-go'

" Python
Plugin 'hdima/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set theme
" set background=dark
" let g:gruvbox_italic = 1
" colorscheme gruvbox

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" ALE
" Remember to install latest rust-analyzer
let g:ale_linters = {
\   'rust': ['analyzer'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['deno'],
\   'typescript': ['deno'],
\   'rust': ['rustfmt'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_hover_cursor = 1
let g:airline#extensions#ale#enabled = 1

nmap gR <Plug>(ale_rename)
nmap gr <Plug>(ale_find_reference)
nmap gd <Plug>(ale_go_to_definition)
nmap gD <Plug>(ale_go_to_type_definition)
nmap gh <Plug>(ale_hover)
" nnoremap <leader>gh :ALEHover<CR>

" rust.vim
let g:rustfmt_autosave = 1

" NERDTreeToggle
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Focus shortcut (<CR> means carriage return for EX commands)
nnoremap <leader>nt :NERDTreeFocus<CR>
