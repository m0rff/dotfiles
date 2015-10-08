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
Plugin 'will133/vim-dirdiff'
Plugin 'chriskempson/base16-vim'
Bundle 'edkolev/tmuxline.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
set backspace=indent,eol,start

set showcmd
set incsearch
set number
set expandtab
set tabstop=4
set nowrap
set shiftwidth=4
set hlsearch
set ic
set autoindent
set copyindent
set cmdheight=1
set smartcase
set smarttab
set ignorecase
set incsearch

set history=1000
set undolevels=1000

syntax on
set laststatus=2

set pastetoggle=<F2>

set nobackup
set noswapfile
set showmatch

set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

nnoremap ; :
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:airline_powerline_fonts = 1
let g:airline_theme = 'kolor'

set background=dark
colorscheme base16-default
let base16colorspace=256

let g:tmuxline_preset = {
      \'a'    : '%R',
      \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%a', '%Y'],
      \'z'    : '#H'}

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
