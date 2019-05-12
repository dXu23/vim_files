" Thanks to Steve Losh's 'Learn Vimscript the Hard Way'

" Basic settings ---------------------- {{{

execute pathogen#infect()
syntax on
colorscheme desert
filetype plugin on

" Search options
set incsearch
set hlsearch

" Tab options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set expandtab

" Line options
set number relativenumber
set numberwidth=4
set wrap
set shiftround
set matchtime=4
" set foldlevel=0
set backspace=2
autocmd BufNewFile * :write
if has ("autocmd")
    " Thanks to
    " https://www.reddit.com/r/vim/comments/4ttz0c/tabs_or_spaces/
    autocmd colorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
endif
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /[^\t]\t/

" make the whitespace characters more visible!
set listchars=tab:»·,trail:·,precedes:<,extends:>
set list

" }}}

" Basic Bindings/Mappings ---------------------- {{{
" Map Leaders ---------------------- {{{
" mapleader 
let mapleader = " "

" localmapleader
let maplocalleader = "\\"
" }}}

" Insert Mode Bindings ---------------------- {{{
" Capitalize word in insert mode
inoremap <leader><c-u> <esc>viwUea
" }}}

" Normal Mode Bindings ---------------------- {{{
" Move current line down one line 

nnoremap <leader>- ddp

" Move current line up one line 
nnoremap <leader>_ kddpk

" Capitalize word in normal mode
nnoremap <leader><c-u> gUaw

" Easily edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Easily source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Insert quotation marks around a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Bind cnext and cprevious
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>

" }}}

" Visual Mode Bindings ---------------------- {{{
" Insert quotation marks around a visual selection
vnoremap <leader>" A"<esc>`<i"<esc>
vnoremap <leader>' A'<esc>`<i'<esc>
"}}}

" Operator Pending Mode Bindings ---------------------- {{{
" Operate on nearest front parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

" Operate on nearest back parentheses
onoremap il) :<c-u>normal! F)vi(<cr>

" Operate on nearest front brackets
onoremap in{ :<c-u>normal! f{vi{<cr>

" Operate on nearest back brackets
onoremap il} :<c-u>normal! F}vi{<cr>

" Operate on nearest front brackets
onoremap in< :<c-u>normal! f<vi<<cr>

" Operate on nearest back brackets
onoremap il> :<c-u>normal! F>vi><cr>
" }}}
" }}}

" iabbrevs for commonly mistyped words ---------------------- {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
" }}}

" FileType-specific Settings ---------------------- {{{
" C-specific auto commands
augroup filetype_c
    autocmd!
    set cindent

    " <localleader>-c comments out code
    autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>

    " <localleader>-c in visual mode comments out a block
    autocmd FileType c vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>

    " Typing iff becomes if()
    autocmd FileType c iabbrev <buffer> iff if ()<left>
    
    " Typing ret becomes return ;
    autocmd FileType c iabbrev <buffer> ret return;<left>

augroup END

augroup filetype_arduino
    autocmd!

    " <localleader>-c comments out code
    autocmd FileType arduino nnoremap <buffer> <localleader>c I// <esc>

	" <localleader>-c in visual mode comments out a block
	autocmd FileType arduino vnoremap <buffer> <localleader>c A<cr>*/<esc>'<O/*<esc>
	" A */<esc>'<i/* <esc>
    
    " Typing iff becomes if()
    autocmd FileType arduino iabbrev <buffer> iff if ()<left>
    
    " Typing ret becomes return ;
    autocmd FileType arduino iabbrev <buffer> ret return;<left>

augroup END

" HTML-specific auto commands
augroup filetype_html
    autocmd!


    autocmd FileType html set tabstop=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set shiftwidth=2

    autocmd FileType html set tabstop=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set shiftwidth=2
    autocmd FileType html set smartindent
    autocmd FileType html set autoindent


augroup filetype_html


" Javascript-specific auto commands
augroup filetype_javascript
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>

    " Typing iff becomes if()
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>

	autocmd FileType javascript vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>
    
    " Typing ret becomes return ;
    autocmd FileType javascript iabbrev <buffer> ret return;<left>
augroup END


" Latex-specific auto commands
augroup filetype_latex
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType latex nnoremap <buffer> <localleader>c I% <esc>

	autocmd FileType latex set tabstop=2
	autocmd FileType latex set softtabstop=2
	autocmd FileType latex set shiftwidth=2
	autocmd FileType latex set smartindent
	autocmd FileType latex set autoindent
augroup END


augroup filetype_markdown
    autocmd!
    " Operate on Markdown headings
    onoremap FileType markdown ih :<c-u>execute "normal! ?\\(^==\\+$\\\|^--\\+$\\)\r:nohlsearch\rkvg_"<cr>

    " Operate on Markdown headings and on line underneath
    onoremap FileType markdown ah :<c-u>execute "normal! ?\\(^==\\+$\\\|^--\\+$\\)\r:nohlsearch\rg_vk0"<cr>
augroup END


" Python-specific auto commands
augroup filetype_python
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>

    " Typing iff becomes if()
    autocmd FileType python iabbrev <buffer> iff if:<left>

    " Typing ret becomes return ;
    autocmd FileType python iabbrev <buffer> ret return


    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif


augroup END

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" }}}

" Status Line {{{
set laststatus=2
set statusline=%.20F\ -\ FileType:\ %y\ \|\ Current:\ %04l\ Total:\ %04L
"}}}
set tags=tags
