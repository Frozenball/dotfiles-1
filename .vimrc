" BASIC CUSTOMIZATIONS

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

" Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete
" over line breaks, or automatically-inserted indentation, or the place where
" insert mode started:
" ref: http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" search settings
set incsearch
set hlsearch

" remove .ext~ files but not the swapfiles
set nobackup
set writebackup
set noswapfile

" display matching files
set wildmenu

" suggestion for normal mode commands
set wildmode=longest:full,full

" minimal menu bar
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" keep cursor visible within 5 lines
set scrolloff=5

" highlight the cursor
set cursorline

" indentation
set expandtab " force to use spaces for indentation
set autoindent " press Enter, start the new line at the same indent as the previous line
set smartindent " treat *.py with 'tab' favor
set shiftwidth=4 " block indent/unindent blocks using < and >
set tabstop=4 " 4-space indent
set softtabstop=4 " see multiple spaces as tabstops

" color column
set colorcolumn=80

" more natural splitting
set splitbelow
set splitright

" more convenient macro-ing
nnoremap <Space> @q

" PLUGIN MANAGER
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'vim-latex/vim-latex'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mkitt/tabline.vim'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround' " allow easy editing surrounding tags
Plug 'tpope/vim-fugitive' " integrate Git
Plug 'mattn/emmet-vim' " this plugin is useful for html, xml editing (more advanced than ragtag)
Plug 'ternjs/tern_for_vim'
Plug 'othree/javascript-libraries-syntax.vim' " syntax libraris for different js projects
Plug 'burnettk/vim-angular'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'python-mode/python-mode' " better python support than builtin one
Plug 'w0rp/ale' " async lint

" Initialize plugin system
call plug#end()

" PLUGINs

" vim-latex
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'

" theme
let g:seoul256_background = 235 " ranging from 233 (darkest) to 239 (lightest)
let g:seoul256_light_background = 253 " ranging from 252 to 256
colo seoul256
" colo seoul256-light
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    "   " render properly when inside 256-color tmux and GNU screen.
    "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" Vim markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_hotkey='<C-m>'

" NERDTree-related stuffs
" toggle NERDTree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" automatically open NERDTree when starting vim with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" tagbar
nmap <F8> :TagbarToggle<CR>

" JS libraries syntax
let g:used_javascript_libs = 'angularjs,jasmine,gulp'

" tabline
hi TabLine      ctermfg=Black  ctermbg=Brown cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Brown cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" autoformat
noremap <F3> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'

" indentation line
let g:indentLine_char = '┆'
let g:indentLine_indentLevel = 8 " improve pfm. in big files (def. = 20)

" fzf
let g:fzf_layout = { 'right': '50%' } " set fzf layout
" ag word under cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
xnoremap <silent> <Leader>ag :<C-W>Ag <C-R><C-*><CR>
" BLines word under cursor
nnoremap <silent> <Leader>bl :BLines <C-R><C-W><CR>
xnoremap <silent> <Leader>bl :<C-W>BLines <C-R><C-*><CR>

" Async Lint Engine
let g:ale_enabled = 0 " disable ALE by default
let g:ale_linters = {
            \'python': ['flake8'],
            \}
nnoremap <F2> :ALEToggle<CR>
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)
