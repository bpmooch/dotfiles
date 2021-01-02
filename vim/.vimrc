" General
set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax on

" personal
set tabstop=8 softtabstop=0 noexpandtab shiftwidth=2 smarttab
" ua standard
" set noexpandtab copyindent preserveindent softtabstop=0 shiftwidth=2 tabstop=2

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'dracula/vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'

" Rust
Plugin 'rust-lang/rust.vim'

" Go
Plugin 'fatih/vim-go'

" Python
Plugin 'hdima/python-syntax'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'Quramy/vim-js-pretty-template'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'

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

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1

" rust.vim
let g:rustfmt_autosave = 1

" vim js pretty template
" Register tag name associated the filetype
call jspretmpl#register_tag('gql', 'graphql')

autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl

autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only
