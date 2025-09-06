filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable "Включает подсветку синтаксиса
set number "Отображение номеров строк
set cursorline "Подсвечивать строку с курсором

set autoindent noexpandtab tabstop=4 shiftwidth=4

" нужен curl!!!!
"Автоматическая установка менеджера плагинов vim
if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"после установки плагинов запустить :PlugInstall
call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Тут будут описаны наши плагины
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'girishji/vimcomplete'
call plug#end() "Перестать это делать


colorscheme default "Добавьте это НЕ в список плагинов

if executable('rg')
    let g:ackprg = 'rg -S --no-heading --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

