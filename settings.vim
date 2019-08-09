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
set foldmethod=indent
set foldlevelstart=99
set cino=N-s
match Error /{{{\|}}}/

" Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

" GUI setting
if has('gui_running')
  set nonu
  set cc=80
  set tw=80
  set cole=1
  set go=g

  if has('macunix')
    set clipboard=unnamed
    set guifont=D2Coding:h14
    cd ~/Documents
  endif

  if has('win32' || 'win32unix')
    set syntax=markdown
    set encoding=cp949
    set fileencodings=utf-8,cp949
    set langmenu=cp949
    set guifont=D2Coding:h12:cHANGEUL:qDRAFT
    set lines=26 columns=120
    cd ~/Dropbox/Site/md/
  endif
endif
