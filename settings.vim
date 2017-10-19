" Settings
syntax on
set backspace=indent,eol,start
set esckeys
set magic
set wildmenu
set lazyredraw " redraw only when we need to
set showmatch
set si
set ai
set ws
set showmode
set ruler
set history=1000
set cursorline
set number
set undofile
set undodir=~/.vim/undo

" Folding
set foldenable
set foldmethod=marker
set cino=N-s
match Error /{{{\|}}}/

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
autocmd FileType make setlocal noexpandtab

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" No backup and swap file
set nowritebackup
set noswapfile

" ETC
set fileencoding=utf-8
autocmd BufNewFile,BufRead *.md set filetype=markdown

" GUI setting
if has('gui_running')
  set syntax=markdown
  set encoding=cp949
  set fileencodings=utf-8,cp949
  set langmenu=cp949
  set guifont=D2Coding:h12:cHANGEUL:qDRAFT
  set lines=26 columns=80
  cd ~/Dropbox/Miki/md
  set nonu
  set cc=80
  set tw=80
  map <f12> :silent !cmd /Q /C ""python" "c:\%HOMEPATH\%/Dropbox/Miki/web_gen.py""<CR>
endif 

