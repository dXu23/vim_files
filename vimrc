vim9script

# Thanks to Steve Losh's 'Learn Vimscript the Hard Way'

# Basic settings ---------------------- {{{

source ~/.vim/packages.vim

filetype plugin indent on
if !exists("g:syntax on")
    syntax enable
endif

colorscheme desert

# Gui Options for vim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

# Search options
set incsearch
set hlsearch

# Tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

# Line options
set number relativenumber
set numberwidth=4
set wrap
set shiftround
set matchtime=4

# Folds
set backspace=2

# Enable visible tabs and spaces
if has("autocmd")
    # Thanks to
    # https://www.reddit.com/r/vim/comments/4ttz0c/tabs_or_spaces/
    autocmd colorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
endif
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /[^\t]\t/

# make the whitespace characters more visible!
set listchars=tab:»·,eol:↲,trail:·,precedes:<,extends:>
set list


# Snippets
g:UltiSnipsExpandTrigger = '<tab>'
g:UltiSnipsJumpForwardTrigger = '<tab>'
g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
g:UltiSnipsListSnippets = '<c-s-tab>'
g:UltiSnipsSnippetsDir = '~/.vim/mySnippets'
g:UltiSnipsSnippetDirectories = ["mySnippets"]

# }}}

# Basic Bindings/Mappings ---------------------- {{{
# Map Leaders ---------------------- {{{
# ma pleader 
g:mapleader = " "

# local map leader
g:maplocalleader = "\\"
# }}}

# Insert Mode Bindings ---------------------- {{{
# Capitalize word in insert mode
inoremap <leader><c-u> <esc>viwUea
# }}}

# Normal Mode Bindings ---------------------- {{{
# Move current line down one line 

nnoremap <leader>- ddp

# Move current line up one line 
nnoremap <leader>_ kddpk

# Capitalize word in normal mode
nnoremap <leader><c-u> gUaw

# Easily edit .vim RC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

# Easily source .vim RC
nnoremap <leader>sv :source $MYVIMRC<cr>

# Insert quotation marks around a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

# Bind next and previous
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

# }}}

# Visual Mode Bindings ---------------------- {{{
# Insert quotation marks around a visual selection
vnoremap <leader>" A"<esc>`<i"<esc>
vnoremap <leader>' A'<esc>`<i'<esc>
# }}}


# Operator Pending Mode Bindings ---------------------- {{{
# Operate on nearest front parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

# Operate on nearest back parentheses
onoremap il) :<c-u>normal! F)vi(<cr>

# Operate on nearest front brackets
onoremap in{ :<c-u>normal! f{vi{<cr>

# Operate on nearest back brackets
onoremap il} :<c-u>normal! F}vi{<cr>

# Operate on nearest front brackets
onoremap in< :<c-u>normal! f<vi<<cr>

# Operate on nearest back brackets
onoremap il> :<c-u>normal! F>vi><cr>
# }}}
# }}}


# Command line bindings
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

# iabbrevs for commonly mistyped words ---------------------- {{{
iabbrev adn and
iabbrev teh the
iabbrev waht what
iabbrev tehn then
# }}}

# Code taken from
# http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
# for sane directories

def FollowSymlink()
    current_file = expand('%:p')
    " Check whether file is symlink
    if getftype(current_file) == 'link'
        " if it is a symlink, resolve to actual file path
        " and open the actual file
        actual_file = resolve(current_file)
        silent !execute 'file ' . actual_file
    end
enddef

def SetProjectRoot()
    " default to the current file's directory
    lcd %:p:h
    git_dir = system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not
    " in a git repo)
    is_not_git_dir = matchstr(git_dir, '^fatal:.*')
    " if git project, change local directory to git project root
    if empty(is_not_git_dir)
        lcd `=git_dir`
    endif
enddef

autocmd BufRead *
    \ call FollowSymlink() |
    \ call SetProjectRoot()


# Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
augroup END
# }}}
# }}}

# Status Line {{{
set laststatus=2
set statusline=%.20F\ -\ FileType:\ %y\ \|\ Current:\ %04l\ Total:\ %04L
# }}}


set tags=tags

# FZF
nnoremap <C-p> :<C-u>FZF<CR>

