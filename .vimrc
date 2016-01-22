set nocompatible
syntax enable
set background=dark
colorscheme solarized
set laststatus=2
let g:airline_powerline_fonts = 1

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Show only selected in Visual Mode
nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

" Split the window using some nice shortcuts
nmap <leader>s<bar> :vsplit<cr>
nmap <leader>s- :split<cr>
nmap <leader>s? :map <leader>s<cr>

" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"
" " Turn on the WiLd menu
set wildmenu
"
" " Ignore compiled files
set wildignore=*.o,*~,*.pyc
"
" "Always show current position
set ruler
"

" open help in vertical split
au BufWinEnter {*.txt} if 'help' == &ft | wincmd H | nmap q :q<CR> | endif


" Scripts and Plugins " {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle

Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive.git'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-vinegar.git'

Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'snipMate'

Plugin 'matchit.zip'
Plugin 'KevinGoodsell/vim-csexact'

" End of plugins

" Indenting options
" Disable comment auto-indenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" enable auto indent
filetype plugin indent on      " Automatically detect file types.
" Keyboard binding for on the fly indent switching
nnoremap <F8> :setl noai nocin nosi inde=<CR>

