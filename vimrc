" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ---------------------------------------------------
" Behaviour {{{
" ---------------------------------------------------
set nocompatible
let vimfiles_path = expand('<sfile>:h')
set wildmenu
set magic
set showmatch
set wrapscan
set history=1000
set clipboard=unnamed
"" file
set nowritebackup
set noswapfile
set undofile
if has('win32') || has('win32unix')
    let &undodir=vimfiles_path."\\undo"
else
    let &undodir=vimfiles_path."/undo"
endif
if empty(glob(&undodir))
    execute "silent !mkdir ".&undodir
endif
set fileencoding=utf-8
autocmd BufNewFile,BufRead *.md set filetype=markdown | set syntax=markdown
"set thesaurus=?
"" search
set hlsearch
set incsearch
set ignorecase
set smartcase
"map <space> <nop>
let mapleader=" "  " <space> \"\<space>\"
" }}}
" ---------------------------------------------------
" Plugins {{{
" ---------------------------------------------------
"" Vim-plug
if has('win32') || has('win32unix')
    if empty(glob('$HOME/vimfiles/autoload/plug.vim'))
        cd ~
        silent !curl -fLo "vimfiles/autoload/plug.vim" --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif
call plug#begin(vimfiles_path.'/plugged')
Plug 'junegunn/vim-plug'
if executable('fzf')
    set rtp+=/usr/local/opt/fzf
    Plug 'junegunn/fzf.vim'
    if executable('ag')
        silent !export FZF_DEFAULT_COMMAND='ag -l'
    endif
else
    Plug 'kien/ctrlp.vim'
endif
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vimwiki/vimwiki'
if executable('ag')
    Plug 'rking/ag.vim'
endif

"" Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'yuttie/hydrangea-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/cosmic_latte'
call plug#end()
filetype plugin indent on
"" file search
if executable('fzf')
    nnoremap <C-p> <esc>:Files<CR>
    nnoremap <leader>b <esc>:Buffers<CR>
    nnoremap <leader>v <esc>:History<CR>
    nnoremap <leader><leader> <esc>:Tags<CR>
else
    " CtrlP settings
    execute "set runtimepath^=".vimfiles_path."/plugged/ctrlp"
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    " Ignore some folders and files for CtrlP indexing
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
                \ 'file': '\.so$\|\.dat$\|\.DS_Store$\|\.o$\|\.x$'
                \ }
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
        let g:ctrlp_use_caching = 0
    endif
    nnoremap ; <esc>:CtrlPBuffer<CR>
    nnoremap <leader>b <esc>:CtrlPBuffer<CR>
    nnoremap <leader>v <esc>:CtrlPMRU<CR>
    nnoremap <leader><leader> <esc>:CtrlPTag<CR>
endif
"" nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"" Air-line last status all the time
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"" Indent Guides
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1
"" Gitgutter
set updatetime=1000
" }}}
" ---------------------------------------------------
" indentation {{{
" ---------------------------------------------------
set autoindent
set cindent  " or smart indent
set cino=N-s
"" <tab> behaviour
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd FileType make setlocal noexpandtab
" }}}
" ---------------------------------------------------
" screen {{{
" ---------------------------------------------------
set lazyredraw  " redraw only when we need to
set ruler
set number
set cursorline
set colorcolumn=80,120  " soft limit and hard limit
set textwidth=120
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'
set conceallevel=2
set completeopt=menuone,preview
" space is required below
set list lcs=tab:\|\ 
" Colorscheme Settings
set t_Co=256
set t_ut=
set background=dark
colorscheme PaperColor
hi Search term=reverse ctermbg=Red ctermfg=Black guibg=Yellow guifg=Black
hi CursorColumn term=reverse ctermbg=Black guibg=grey40
hi CursorLine term=none cterm=bold guibg=grey40
hi Visual guifg=White guibg=LightBlue gui=none cterm=bold ctermbg=DarkGrey
" GUI related
if has('gui_running')
    set go=g
    set lines=48 columns=128
    if has('macunix')
        set guifont=D2Coding:h16
    endif
    if has('win32') || has('win32unix')
        set encoding=cp949
        set fileencodings=utf-8,cp949
        set langmenu=cp949
        set guifont=D2Coding:h12:cHANGEUL:qDRAFT
    endif
    cd ~/Documents
    autocmd VimEnter {} setlocal syntax=markdown
endif
" }}}
" ---------------------------------------------------
" folding {{{
" ---------------------------------------------------
set foldenable
set foldlevelstart=99
set foldmethod=indent
set foldtext=gitgutter#fold#foldtext()
"match Error /{{{\|}}}/
" }}}
" ---------------------------------------------------
" functions {{{
" ---------------------------------------------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif
command! -nargs=+ -complete=file NewGrep execute 'silent grep! <args>' | redraw! | copen 8
if executable('ag')
    map <Leader>fu :silent execute " !ag " . expand("<cword>") . " " <bar> cwindow<bar> redraw! <CR>
else
    map <Leader>fu :execute " grep! -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow <bar> redraw! <CR>
endif
map <Leader>gr :<C-u>NewGrep 
"" Toggle functions
function! ToggleNumber()
    if &number
        set nonumber
    else
        set number
    endif
endfunction
function! ToggleRelativeNumber()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
function! ToggleFold()
    if &foldlevel
        set foldlevel=0
    else
        set foldlevel=99
    endif
endfunction
" }}}
" ---------------------------------------------------
" keybinding {{{
" ---------------------------------------------------
set backspace=indent,eol,start
nnoremap <Tab> <C-w>
tnoremap <F1> <C-\><C-n>
"" better movement
nnoremap j gj
nnoremap k gk
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-b> <S-Left>
inoremap <M-f> <Right>
vnoremap <leader> "+y
""" quick fix
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz
""" buffer
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
""" tab
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>
""" line
" nnoremap <silent> <C-k> :move-2<CR>
" nnoremap <silent> <C-j> :move+<CR>
" nnoremap <silent> <C-l> >>
" nnoremap <silent> <C-h> <<
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-l> >gv
xnoremap <silent> <C-h> <gv
vnoremap > >gv
vnoremap < <gv
xnoremap > >gv
xnoremap < <gv
"" formatting
inoremap <F12> <ESC>ggVG=``zzi
nnoremap <F12> ggVG=``zz
vnoremap Q gq
nnoremap Q gqap
"" management
"nnoremap <leader>q :bp\|bd #<CR>
nnoremap <leader>q :bd!<CR>
nnoremap <leader>n :enew!<CR>
nnoremap <leader>N :tabnew<CR>
"" fold
nnoremap <leader>ff za
"" file
nnoremap <leader>gf ^f(:e %:h/<cfile><CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <F8> "=strftime("[%Y-%m-%d %H:%M:%S] ")<CR>PA
inoremap <F8> <C-R>=strftime("[%Y-%m-%d %H:%M:%S] ")<CR>
nnoremap <leader>; :enew<CR>:set paste<CR>gg"+P:set syntax=markdown<CR>:set nopaste<CR>:set textwidth=0 lbr<CR>:echo "Clipboard loaded"<CR>
nnoremap <leader>' gg"+yG:bd!<CR>:echo "Clipboard saved"<CR>
"" NERD Commenter
map <Leader>/ <Plug>NERDCommenterToggle
"" toggle settings
nnoremap <leader>ti :IndentGuidesToggle<CR>
nnoremap <leader>tgg :GitGutterToggle<CR>
nnoremap <leader>tgs :GitGutterSignsToggle<CR>
nnoremap <leader>tgl :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>tgf :GitGutterFold<CR>
nnoremap <leader>tn :<C-U>call ToggleNumber()<CR>
nnoremap <leader>tf :<C-U>call ToggleFold()<CR>
nnoremap <leader>tr :<C-U>call ToggleRelativeNumber()<CR>
"" Goyo: Distraction-free mode
noremap <leader>tdf <ESC>:Goyo<CR>
"" Configure
nnoremap <leader>E :execute "edit ".vimfiles_path."/vimrc"<CR>gg
nnoremap <leader>R :execute "source ".vimfiles_path."/vimrc"<CR>gg
nnoremap <leader>p :cd %:h:r<CR>
nnoremap <leader>r :<C-u>redraw!<CR>
" }}}
