" Thanks to Steve Losh's 'Learn Vimscript the Hard Way'

" Basic settings ---------------------- {{{

filetype plugin on
syntax on
execute pathogen#interpose('bundle/ultisnips')
execute pathogen#helptags()

colorscheme desert

" Search options
set incsearch
set hlsearch

" Tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
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

" Enable visible tabs and spaces
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

" Spellcheck
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-s-tab>'
let g:UltiSnipsSnippetsDir = '~/.vim/mySnippets'
let g:UltiSnipsSnippetDirectories = ["mySnippets"]



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

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

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
iabbrev teh the
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
    autocmd FileType html set autoindent


augroup filetype_html


" Javascript-specific auto commands
augroup filetype_javascript
    autocmd!
    " Javascript ultisnippets
    autocmd FileType javascript :UltiSnipsAddFiletypes javascript

    " <localleader>-c comments out code
    autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>

    " Typing iff becomes if()
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>

	autocmd FileType javascript vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>
    
    " Typing ret becomes return ;
    autocmd FileType javascript iabbrev <buffer> ret return;<left>
augroup END


let g:tex_flavor='latex'

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
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif


augroup END

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
augroup END
" }}}
" }}}

" Status Line {{{
set laststatus=2
set statusline=%.20F\ -\ FileType:\ %y\ \|\ Current:\ %04l\ Total:\ %04L
"}}}

set tags=tags
