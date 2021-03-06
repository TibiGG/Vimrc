" Vundle Settings --------------------------------{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
Plugin 'preservim/nerdtree'

" adding my own plugin for processing 'potion' files
" Plugin 'TibiGG/potion'

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

" }}}

" Basic Settings -------------------- {{{
set number relativenumber
set wrap
set expandtab tabstop=4
set softtabstop=0
set shiftwidth=2
set smarttab
set autoindent
set hlsearch incsearch
nohlsearch
syntax on     " syntax highlighting on
" }}}

" Leader Settings ---------------------- {{{
let mapleader = "\<Space>"
let maplocalleader = "\\"
" }}}

" Status Line --------------------- {{{
set laststatus=2          " Always have the status bar on
set statusline=%f         " Path to the file

" TODO: add different stuff depending on the FileType
set statusline+=\ -\      " Separator
set statusline+=FileType: " FileType Indicator
set statusline+=\         " Separator
set statusline+=%y        " FileType Macro

set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
" }}}

" Mappings --------------------- {{{

" Move line down/up
noremap - ddp
noremap _ ddkP

" Move cursor to beginning/end of line
nnoremap H 0
nnoremap L $

" Uppercase a whole word in insert/normal mode -------------{{{
" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the
" current word to uppercase.  It's handy when you're writing names of
" constants and don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While
" your cursor is at the end of the word, press <c-u> to uppercase it,
" and then continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor
" location in the z mark, using gUiw to uppercase inside the current
" word, moving back to the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never
" use it, but if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za
" inoremap <c-u> <esc>viWUEa
nnoremap <c-u> viWUE
" }}}

" Edit my Vimrc function
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source(run) my Vimrc function
nnoremap <leader>sv :source $MYVIMRC<cr>
" Source(run) current file
nnoremap <leader>sf :source %<cr>

" Quote current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Quote selected text
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>l
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>l

" Remapping arrow keys to useful commands -----------------{{{
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" }}}

" Match Trailing Whitespaces with Error Group ------{{{
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :match none<cr>
" }}}

" Stop Highlighting items from the last search ---------{{{
nnoremap <leader>H :nohlsearch<cr>
" }}}

" Automatically add \v whenever beginning a search ------{{{
nnoremap / /\v
nnoremap ? ?\v
" }}}

" Add forgotten semicolumn and return back to cursor position -------------- {{{
nnoremap <leader>; mqA;<esc>`q
" }}}

" Open Previous Buffer in vsplit window --------- {{{
nnoremap <leader>pb :execute "rightbelow vsplit " . bufname("#")<cr>
" }}}

" Code Comment Mappings --------------------- {{{
augroup code_comments
  autocmd!
  autocmd FileType python            nnoremap <buffer> <localleader>c I# <esc>j
  autocmd FileType c,javascript,java nnoremap <buffer> <localleader>c I// <esc>j
  autocmd FileType c,javascript,java vnoremap <buffer> <localleader>c <esc>`<i/*<cr><esc>`>a<cr>*/<esc>l
augroup END
" }}}

" }}}

" Abbreviations ------------------- {{{

" Useful shortcut abbreviations
iabbrev @@ tg4018@imperial.ac.uk
iabbrev ccopy Copyright 2020 Tiberiu-Andrei Georgescu, all rights reserved.
iabbrev ssig -- <cr>Tiberiu-Andrei Georgescu<cr>tg4018@imperial.ac.uk
" TODO: add more abbreviations for code!

" }}}

" FileType-specific Settings ------------------ {{{

" HTML file settings ------------------------- {{{
augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" Markdown file settings ------------------------- {{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" Vimscript file settings ------------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END
" }}}

" }}}

" Code snippets ------------------------------- {{{

" Python Code Snippets ------------------------- {{{
augroup code_snippets_python
  autocmd!
  autocmd FileType python                   :iabbrev <buffer> iff if:<left>
augroup END
" }}}

" Javascript Code Snippets ------------------------- {{{
augroup code_snippets_javascript
  autocmd!
  autocmd FileType javascript               :iabbrev <buffer> fun function
augroup END
" }}}

" Common Code Snippets ----------------------- {{{
augroup code_snippets_common
  autocmd!
  autocmd FileType c,javascript,java        :iabbrev <buffer> iff if ()<left>
  autocmd FileType c,javascript,java        :iabbrev <buffer> { {}<left>
  autocmd FileType python,c,javascript,java :iabbrev <buffer> ret return
  autocmd FileType python,c,javascript,java :iabbrev <buffer> ( ()<left>
augroup END
" }}}

" DISABLED
" Training Abbreviations for Code Snippets ------------------- {{{
" augroup train_group
"   autocmd!
"   autocmd FileType python,c,javascript,java :iabbrev <buffer> return NOPENOPENOPENOPE
"   autocmd FileType javascript               :iabbrev <buffer> function NOPENOPENOPENOPE
" augroup END
" }}}

" }}}

" Operator Pending Mappings ---------------- {{{

" Single Quotes Search and Edit ------------------ {{{
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap an' :<c-u>normal! f'va'<cr>
onoremap al' :<c-u>normal! F'va'<cr>
" }}}

" Double Quotes Search and Edit ------------------ {{{
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap an" :<c-u>normal! f"va"<cr>
onoremap al" :<c-u>normal! F"va"<cr>
" }}}

" Braces Search and Edit ------------------ {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
" }}}

" Curly Braces Search and Edit ------------------ {{{
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
" }}}

" Email Search and Edit ------------------ {{{
onoremap in@ :<c-u>execute "normal! /[a-zA-Z0-9\\._\\-\\+\\%]\\+@[a-zA-Z0-9\\.\\-_]\\+\\.[a-z]\\+\r:nohlsearch\rvt@"<cr>
onoremap an@ :<c-u>execute "normal! /[a-zA-Z0-9\\._\\-\\+\\%]\\+@[a-zA-Z0-9\\.\\-_]\\+\\.[a-z]\\+\r:nohlsearch\rvE"<cr>
onoremap il@ :<c-u>execute "normal! ?[a-zA-Z0-9\\._\\-\\+\\%]\\+@[a-zA-Z0-9\\.\\-_]\\+\\.[a-z]\\+\r:nohlsearch\rvt@"<cr>
onoremap al@ :<c-u>execute "normal! ?[a-zA-Z0-9\\._\\-\\+\\%]\\+@[a-zA-Z0-9\\.\\-_]\\+\\.[a-z]\\+\r:nohlsearch\rvE"<cr>
" }}}

" }}}

" Extra Plugin Settings -------------{{{
"
" Potion Settings -------------------{{{
let g:potion_command = "/home/tibigg/Documents/GitRepos/potion/bin/potion"
" }}}
"
" NERDTree Settings -------------------{{{
" Notation fix
let g:NERDTreeNodeDelimiter = "\u00a0"
" Mappings for easy access
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>tn :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" }}}
"
" }}}
