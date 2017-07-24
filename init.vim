" Package manager
if &compatible
  set nocompatible  " Be iMproved
endif

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdtree')

  call dein#end()
  call dein#save_state()
endif

" General settings
syntax enable
set nu
set cursorline
set ignorecase
set smartcase
set wildmode=longest,list,full

" fold control
set foldmethod=indent
set foldnestmax=1
set foldlevel=0

" Tab - Space indent behavior
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Visual stuff
set colorcolumn=80,100,120
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:.
set list
let g:airline_powerline_fonts = 1
let g:is_bash = 1

" Strip trailing whitespace for these filetypes
autocmd FileType c,cpp,java,php,sh,python,vim autocmd BufWritePre <buffer> %s/\s\+$//e

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
colorscheme gruvbox
set background=dark

" Filetypes
autocmd FileType vim setl sw=2 sts=2 ts=2
filetype plugin indent on

" Shortcuts
let mapleader="\<SPACE>"
inoremap jj <esc>
noremap j gj
noremap k gk

" repeat selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" keep more context when scrolling off the end of a buffer
set scrolloff=10

" move search result to middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

"
" plugin settings
"
au vimenter * if !argc() | NERDTree | endif

