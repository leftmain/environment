
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
map <C-p>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
map <C-p>8 :set tabstop=8<CR>:set shiftwidth=8<CR>
map <C-u> <C-w>h
map <C-i> <C-w>l
" really need?
map <C-v> <C-w>v

call plug#begin('~/.vim/plugged')

" NERD Tree & Commenter
Plug 'preservim/nerdtree' ", { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" LightLine
"Plug 'itchyny/lightline.vim'

" Solarized theme
"Plug 'altercation/vim-colors-solarized'
"Plug 'lifepillar/vim-solarized8'

" Fzf
" Если после --all добавить некоторые флаги, то можно исключить интеграция fzf в консоль.
" --no-bash --no-zsh --no-fish
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}

Plug 'junegunn/fzf.vim'

" TagLists (Поиск функций в файле)
"Plug 'vim-scripts/taglist.vim'

call plug#end()


" Основные настройки vim'а.
" Начало взять с http://www.cyberforum.ru/cpp-linux/thread712131.html

set number " нумерация строк
set bs=indent,eol,start " backspace без глюков
set nocompatible " несовместимость с VI
"set wrap " включаем перенос строк
"set linebreak " перенос по словам, а не по буквам
set showcmd " просмотр выполняемой команды в правом нижнем углу
set ruler " показывать строку с позицией курсора
syntax on " подсветка синтаксиса
set mouse= " отключение мыши
"set showmatch " показывать первую парную скобку после ввода второй
set showtabline=2 " всегда показывать строку вкладок
"set laststatus " всегда показывать строку статуса
set title " показывать имя буфера в заголовке терминала
set confirm " использовать диалоги вместо сообщения о ошибках
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P " включение дополнительной информации о статусной строке
set visualbell " мигание вместо звукового сигнала
set hidden " не выгружать буфер при переключении на другой файл
" Если t_Co установлен в 256, то используется 256 цветовая тема, иначе 16ти
set t_Co=256 " использовать больше цветов в терминале
set smartindent " включаем умную автоматическую расстановку отступов
set autoindent " наследовать отступы предыдущей строки
set tabstop=4 " размер табуляции
set shiftwidth=4 " размер сдвига при нажатии на клавиши < или >
set cursorline " подсветка текущей строки
set expandtab " пробелы вместо tab
autocmd FileType make setlocal noexpandtab " в Makefile tab это '\t'
"set autoread " автоматическое перечитывание файла при изменении
set pastetoggle= " сохраняет отступы при вставке фрагмента
set splitbelow " разбивать окно горизонтально снизу
set splitright " разбивать окно вертикально справа
"set nofoldenable " отклключить фолдинг по умолчанию
"set foldmethod=syntax " фолдинг (сворачивание блоков кода) (zc - свернуть, zo - развернуть)
"set completeopt=longest,menuone "автодополнение


set nohlsearch " отключение подсветки найденного выражения
set smartcase " поиск с учетом регистра
set nowrapscan " останавливать поиск при достижении конца файла
set history=150 " история команд
set undolevels=1000 " история правок
set infercase " предлагать авто-дополнения на основе уже введенного

" set noswapfile " отключение создание swap файлов
" set dir=~/.vim/swap/ " все файлы swap будут помещаться в эту директорию
" set nobackup " отключение создания бекапов (если свет вырубят, повеселишься)

language en_US.UTF-8 " использовать анлийскую локаль на любой системе
set encoding=utf-8 " кодировка по умолчанию
set termencoding=utf-8 "
set fileformat=unix " формат файла по умолчанию
set wildmenu " показывать все возможные кандидаты для выбора при авто-завершении команд
" set wcm=<TAB>

" Небольшое объяснение по синтаксису мапинга
" map последовательность_клавиш действие
"
" Клавиши:
"
" Shift: <S-...>
" Ctrl: <C-...>
" Meta: <M-...>
" Alt: <A-...>
"
" Пример: map <S-s>k dd //в этом примере последовательное нажатие Sk удалит строку
"
" <F1>...<F12>
"
" Enter: <CR> или <Enter> или <Return>
" Пробел: <Space>
" Esc: <Esc>
"
" РЕЖИМЫ
"
" Normal: режим ввода команд
"
" Visual: режим визуального выделения блоков текста, к которым затем применяются команды Normal режима
"
" Operator-pending: режим, в котором Vim ожидает дополнительного поясняющего ввода (например после " нажатия клавиш d, y, c, и т.п.).
"
" Insert: режим непосредственной вставки текста
"
" Command-line: режим, в котром находится редактор после нажатия клавиш : или /
"
" Lang-Arg: режим поиска
"
" ОБЛАСТЬ ДЕЙСТВИЯ ЗАБИНДЕННЫХ КЛАВИШ
"
" map
"   Normal, Visual, Operator-pending
" map!
"   Insert, Command-line
" nmap
"   Normal
" vmap
"   Visual
" omap
"   Operator-pending
" cmap
"   Command-line
" imap
"   Insert
" lmap
"   Insert, Command-line, Lang-Arg

"map <C-c> y<CR> "позволяет копировать текст нажатием Ctrl+c
"map <C-v> p "позволяет вставлять текст нажатием Ctrl+v
"imap <C-v> <ESC>pi "тоже вставка текста, только в режиме редактирования
"vmap <C-c> y<CR> "копирование текста, только в визуальном режиме

" Следующие четыре мапинга позволяют переключаться между открытыми в VIM'e окнами нажатием alt+стрелки
map <A-Left> <C-w><Left>
map <A-Right> <C-w><Right>
map <A-Up> <C-w><Up>
map <A-Down> <C-w><Down>

" Это биндинги для фолдинга. Позволяют свертывать/разворачивать код в обычном режиме нажатием -/+
" Прим.: + по своей сути это Shift + '='. Дабы ускорить разворачивание бинд на '='.
"map = zo
"map - zc

" Эти биндинги для меню. Благодоря этим биндингам можно нажатиями F1, F2, F3, F4 вызывать различные меню
set wildmenu
set wcm=<Tab>

" Меню работы с файлами. Убрано, ибо предполчитаю :wq и подобное (+ привыкание к горяим клавишам правило хорошего тона).
menu File.Save :w<CR> "сохранение файла
menu File.Load_new_window :sp +Files<CR> "запуск встроеного файлового менеджера в новом окне
menu File.Load_and_save :w<CR> :Files<CR> сохранение и запуск файлового менеджера
menu File.Load :Files<CR> "запуск файлового менеджера в новом окне
menu File.Exit_and_Save :wqa<CR> "полный выход и сохранение
menu File.Exit :qa!<CR> "полный выход без сохранения

" Меню тегов
"menu Taglist.Open/Close :TlistToggle<CR> "открытие taglist
"menu Taglist.Reload :w<CR><C-w><Left>u <C-w><Right> "обновление taglist

" Меню для сворачивания и разворачивания. Так как есть бинд на +-, то своачивание/разворачивание текущего не требуется тут.
"menu Folding.Open zo "открыть свернутый код
"menu Folding.Close zc "скрыть развернутый код
"menu Folding.Open_all zR "открыть все свертки
"menu Folding.Close_all zM "закрыть все свертки

" Изменение кодировки просматриваемого файла.
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

" Мапинги длля вызовов меню
map <F1> :emenu File.<Tab>
"map <F2> :emenu Taglist.<Tab>
"map <F3> :emenu Folding.<Tab>
map <F2> :emenu Encoding.<Tab>

imap <F1> <Esc>:emenu File.<Tab>
"imap <F2> <Esc>:emenu Taglist.<Tab>
"imap <F3> <Esc>:emenu Folding.<Tab>
imap <F2> <Esc>:emenu Encoding.<Tab>

vmap <F1> <Esc>:emenu File.<Tab>
"vmap <F2> <Esc>:emenu Taglist.<Tab>
"vmap <F3> <Esc>:emenu Folding.<Tab>
vmap <F2> <Esc>:emenu Encoding.<Tab>


""" from https://stackoverflow.com/questions/4556184/vim-move-window-left-right
" Ctrl W gives you the "windows command mode", allowing the following modifiers:
" Ctrl W + R - To rotate windows up/left.
" Ctrl W + r - To rotate windows down/right.
" You can also use the "windows command mode" with navigation keys to change a window's position:
" Ctrl W + L - Move the current window to the "far right"
" Ctrl W + H - Move the current window to the "far left"
" Ctrl W + J - Move the current window to the "very bottom"
" Ctrl W + K - Move the current window to the "very top"

" Настройка NERD
map <C-n> :NERDTreeToggle<CR>
"let g:NERDCustomDelimiters = { 'c': { 'left': '// ','right': '' } }

" Если запустить vim командой 'vim', не 'vim filename', то откроется NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Настройка LightLine
" Вся информация взята тут: https://github.com/itchyny/lightline.vim
set laststatus=2
set noshowmode
"let g:lightline = { 'colorscheme': 'solarized dark', }

let g:lightline = {
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \ },
  \ }

function! LightlineFilename()
return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
    \ &filetype ==# 'unite' ? unite#get_status_string() :
    \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
    \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineFileformat()
return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" Настройки темы Solarized
"set background=dark

"if (&t_Co != 256)
"	colorscheme solarized8
"else
"	let g:solarized_termcolors=256
"	"let g:solarized_termtrans=1
"	colorscheme solarized
"endif

" При быстром листании появляется "лажа", что фон не букв становится не того цвета и, как правило, какого-то ядовитого цвета
" Это исправляет этот баг
set t_ut=


" Fzf find
" <C-o> корректно не работает в сочетании с mc
map <F8> :Files<CR>

" Мапинг
" Yakuake (KDE drop-down terminal) style
nmap <F12> :terminal<CR>
map <C-d> :q<CR>
map <C-t> :tabnew<CR>
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map <C-Up> 10k
map <C-Down> 10j

" В каждой строке столбец номер 80 будет подсвечен указанным цветом
"highlight ColorColumn ctermbg=235
"set colorcolumn=80

" При сохранении указанных файлов символы проблеов (и табов), что остались в конце строк удаляются.
" Cейчас стоит *, что говорит о том, что ЛЮБОЙ сохраняемый файл при сохранении обрабатывается указанным образом
" Можно заменить, например, на *.c (как делать '*.c or *.cpp or ...' мне не ведомо
autocmd BufWritePre * :%s/\s\+$//e

