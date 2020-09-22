if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim
  \ --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
" theme
colorscheme mine
syntax enable
set ruler
set number
set numberwidth=1
set mouse=a
set cursorline
set fillchars+=vert:\
set showtabline=2
set title
set t_Co=256
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab
set pastetoggle=
"set autoread
set wildmenu
set t_ut=

" search
nohl
set hlsearch
set incsearch

" keys
nnoremap <silent> <C-m> :nohl<CR><C-l>
map <C-n> :NERDTreeToggle<CR>
map ; :FZF<CR>
nmap \ :terminal<CR>
map <C-d> :q<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
map <C-j> 10j
map <C-k> 10k
map <C-t> :tabnew<CR>
map <C-u> <C-w>h
map <C-i> <C-w>l
map <C-v> <C-w>v


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' ", { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

call plug#end()



