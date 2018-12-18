" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fugitive.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlp.vim'
Plugin 'surround.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/goyo.vim'
Plugin 'vimwiki/vimwiki'
if executable('ag')
	Plugin 'rking/ag.vim'
endif
call vundle#end()

filetype plugin indent on

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
			\ 'file': '\.so$\|\.dat$|\.DS_Store$'
			\ }
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	let g:ctrlp_use_caching = 0
endif
nmap ; <esc>:CtrlPBuffer<CR>
nmap <leader>v <esc>:CtrlPMRU<CR>

" NERD Commenter
map <F4> <Plug>NERDCommenterToggle
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

" Air-line last status all the time
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Indent Guides
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1

" Gitgutter
set updatetime=250

" Goyo
noremap <leader>d <ESC>:Goyo<CR>

" Vimwiki - markdown support
" Help -> :h vimwiki-syntax
let g:vimwiki_ext2syntax = {'.md':'markdown', '.markdown':'markdown', '.mdown':'markdown'}

" vim-instant-markdown - Instand markdown preview
let g:instant_markdown_autostart = 0  " disable auto-start
map <leader>md :InstantMarkdownPreview<CR>
