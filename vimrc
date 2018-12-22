" Thanks to Steve Losh's 'Learn Vimscript the Hard Way'

syntax on
colorscheme desert
filetype plugin on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number relativenumber
set numberwidth=4
set wrap
set shiftround
set matchtime=4

" mapleader
let mapleader = " "

" localmapleader
let maplocalleader = "\\"

" Move current line up one line 
noremap <leader>- ddp

" Move current line down one line 
noremap <leader>_ kddpk

" Capitalize word in insert mode
inoremap <leader><c-u> <esc>viwUea

" Capitalize word in normal mode
nnoremap <leader><c-u> gUaw

" Easily edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Easily source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" iabbrevs for commonly mistyped words
iabbrev adn and
iabbrev waht what
iabbrev tehn then

" Insert quotation marks around a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Insert quotation marks around a visual selection
vnoremap <leader>" A"<esc>`<i"<esc>
vnoremap <leader>' A'<esc>`<i'<esc>

autocmd BufNewFile * :write

" C-specific auto commands
augroup filetype_c
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>
    
    " Typing iff becomes if()
    autocmd FileType c iabbrev <buffer> iff if ()<left>
    
    " Typing ret becomes return ;
    autocmd FileType c iabbrev <buffer> ret return;<left>
augroup END


" HTML-specific auto commands
augroup filetype_html
	autocmd!

	autocmd FileType html set tabstop=2
	autocmd FileType html set softtabstop=2
	autocmd FileType html set shiftwidth=2
augroup filetype_html


" Javascript-specific auto commands
augroup filetype_javascript
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>

    " Typing iff becomes if()
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
    
    " Typing ret becomes return ;
    autocmd FileType javascript iabbrev <buffer> ret return;<left>
augroup END


" Latex-specific auto commands
augroup filetype_latex
    autocmd!
    " <localleader>-c comments out code
    autocmd FileType latex nnoremap <buffer> <localleader>c I% <esc>
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
augroup END

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" Operate on nearest front parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

" Operate on nearest back parentheses
onoremap il) :<c-u>normal! F)vi(<cr>

" Operate on nearest front brackets
onoremap in{ :<c-u>normal! f{vi{<cr>

" Operate on nearest back brackets
onoremap il} :<c-u>normal! F}vi{<cr>

set statusline=%.20F\ -\ FileType:\ %y\ \|\ Current:\ %04l\ Total:\ %04L
