set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'

call vundle#end()            " required
filetype plugin indent on    " required
set backspace=indent,eol,start

set showcmd
set incsearch
set number
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set ic
set autoindent
set cmdheight=1

syntax on
set laststatus=2

set nobackup
set noswapfile
set showmatch

let g:airline_powerline_fonts = 1
let g:airline_theme = 'light'

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=0
set background=dark
colorscheme solarized
let g:tmuxline_preset = 'tmux'
