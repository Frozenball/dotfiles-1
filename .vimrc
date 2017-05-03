"----------------BASIC CUSTOMIZATIONS
" set background
set background=dark

" not compatible with vi
set nocompatible

" turn on syntax highlighting
syntax on

" turn on line numbering
set number

" make vim try to detect file types
filetype on
filetype plugin on
filetype indent on

" reload file outside vim
set autoread

" encoding utf 8
set encoding=utf-8
set fileencoding=utf-8

" greatly enhance search
runtime macros/matchit.vim

" set unix line ending
set fileformat=unix

" Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete over line breaks, or automatically-inserted indentation, or the place where insert mode started:
set backspace=indent,eol,start

" search settings
set incsearch
set hlsearch

" remove .ext~ files but not the swapfiles
set nobackup
set writebackup
set noswapfile

" suggestion for normal mode commands
set wildmode=list:longest

" keep cursor visible within 5 lines
set scrolloff=5

" indentation
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4

"----------------PLUGIN MANAGER
" initialize Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/vim-colors-solarized'

" end plugin definition
call vundle#end()            " required for vundle

"----------------FROM NO PLUGINS

" fuzzy finding files
set path+=**

" display matching files
set wildmenu

" minimal menu bar 
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"----------------VIM-LATEX
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'

"----------------THEME
colorscheme monokai
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    "   " render properly when inside 256-color tmux and GNU screen.
    "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif