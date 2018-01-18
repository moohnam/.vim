" fold
nnoremap <space> zA
nnoremap <leader>f <ESC>:se foldlevel=0<CR>

" Key bindings
imap <F12> <ESC>ggVG=``zzi
map <F12> ggVG=``zz

imap <F9> <ESC>:q!<CR>
map <F9> <ESC>:q!<CR>

" Rebind <Leader> Key
let mapleader=','

map <Leader>qs <esc>:mksession! $HOME/.vim/sessions/quicksave.vim<CR>
map <Leader>ql <esc>:source $HOME/.vim/sessions/quicksave.vim<CR>
map <Leader>r <esc>:source $HOME/.vim/vimrc<CR>
map <Leader>c <esc>:tabnew<CR>
map <Leader>M <esc>:tabnext<CR>
map <Leader>N <esc>:tabprevious<CR>
map <Leader>m <esc>:bnext<CR>
map <Leader>n <esc>:bprevious<CR>
map <Leader>q <esc>:bp\|bd #<CR>

" Better Window
map <Tab> <C-w>
map <Tab><Tab> <C-w>w
map <Leader><Tab> <esc>:vs<CR><C-w>w

" Better Indentation
vnoremap > >gv 
vnoremap < <gv

" Better Movement
inoremap jk <ESC>
inoremap jj <ESC>gj
inoremap kk <ESC>gk
inoremap yy <ESC>yy
inoremap :wq <ESC>:wq
nmap j gj
nmap k gk
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
inoremap <C-d> <Delete>

"highlight last inserted text 
nnoremap gV `[v`]

" Easier block copying to clipboard
vnoremap <space> "+y

" Bind nohl
nnoremap <Leader><space> <ESC>:nohlsearch<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
map V V

" Typo correction for save and exit
ab Wq wq

