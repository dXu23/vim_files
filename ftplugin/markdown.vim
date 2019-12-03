
" Operate on Markdown headings
onoremap <buffer> ih :<c-u>execute "normal! ?\\(^==\\+$\\\|^--\\+$\\)\r:nohlsearch\rkvg_"<cr>

" Operate on Markdown headings and on line underneath
onoremap <buffer> ah :<c-u>execute "normal! ?\\(^==\\+$\\\|^--\\+$\\)\r:nohlsearch\rg_vk0"<cr>
