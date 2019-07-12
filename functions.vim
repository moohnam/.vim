" grep related
command! -nargs=+ NewGrep execute 'silent grep! <args>' | copen 4 | redraw!
map <Leader>gr <esc>:NewGrep 
if executable('ag')
	map <F3> :silent execute " grep! " . expand("<cword>") . " " <bar> cwindow<bar> redraw! <CR>
else
	map <F3> :execute " grep! -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow <bar> redraw! <CR>
endif

" start from the location where you exit
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
