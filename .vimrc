" Basic Settings -------------------- {{{
set number relativenumber
set wrap
set expandtab tabstop=4
set softtabstop=0
set shiftwidth=2
set smarttab
set autoindent
set hlsearch incsearch
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

" Uppercase a whole word in insert/normal mode
inoremap <c-u> <esc>viWUEa
nnoremap <c-u> viWUE

" Edit my Vimrc function
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source(run) my Vimrc function
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quote current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Quote selected text
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>l
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>l

" Remapping arrow keys to useful commands
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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
nnoremap <leader>pb :execute "leftabove vsplit " . bufname("#")<cr>
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

" Training Abbreviations for Code Snippets ------------------- {{{
augroup train_group
  autocmd!
  autocmd FileType python,c,javascript,java :iabbrev <buffer> return NOPENOPENOPENOPE
  autocmd FileType javascript               :iabbrev <buffer> function NOPENOPENOPENOPE
augroup END
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
