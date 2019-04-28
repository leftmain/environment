" \t
set smartindent
set tabstop=8
set shiftwidth=8

" theme
colorscheme mine
syntax enable
set ruler
set number
set numberwidth=1
set mouse=a
set cursorline
set fillchars+=vert:\ 

" search
nohl
set hlsearch
set incsearch

" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call vundle#rc()
filetype plugin indent on
Bundle 'scrooloose/nerdtree'
Bundle 'junegunn/fzf'

" keys
nnoremap <silent> <C-m> :nohl<CR><C-l>
map <C-n> :NERDTreeToggle<CR>
map ; :FZF<CR>
nmap \ :terminal<CR>
map <C-d> :q<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
map <C-j> 20j
map <C-k> 20k
map <C-t> :tabnew<CR>
map <C-p>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
map <C-p>8 :set tabstop=8<CR>:set shiftwidth=8<CR>
map <C-u> <C-w>h
map <C-i> <C-w>l

" other
set splitright
set splitbelow
set autoread

