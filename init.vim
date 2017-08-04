" Package manager
if &compatible
  set nocompatible  " Be iMproved
endif

let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
let g:python3_host_skip_check = 1

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))

  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('Shougo/dein.vim')
  call dein#add('w0rp/ale')
  call dein#add('morhetz/gruvbox')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('google/yapf')
  call dein#add('tpope/vim-fugitive')

  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')

  " Go
  call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-vim')

  call dein#end()
  call dein#save_state()
endif

" General settings
syntax enable
set autoread
set nu
set cursorline
set ignorecase
set smartcase
set relativenumber
set wildmode=longest,list,full

" fold control
set foldmethod=indent
set foldnestmax=1
set foldlevel=0
nnoremap <space> za

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
autocmd FileType elixir,c,cpp,java,php,sh,zsh,python,vim autocmd BufWritePre <buffer> %s/\s\+$//e

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=light

" Filetypes
autocmd FileType vim,yaml setl sw=2 sts=2 ts=2

" Code formatting for python
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

filetype plugin indent on

" Shortcuts / Keybinds
let mapleader=","
vnoremap <Leader>y "+y<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>Q :wqa<CR>
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

" Disable arrow keys (this is for noobs)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"
" plugin settings
"
let g:deoplete#enable_at_startup = 1

" Deoplete settings for go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 0

"
" Ale settings
"
let g:ale_python_isort_executable = '/usr/bin/isort'
let g:ale_python_isort_use_global = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_linters = {
\  'python': ['flake8', 'isort', 'pylint'],
\  'elixir': ['credo', 'dogma']
\}

" When entering vim with no arguments, start NERDTree
au vimenter * if !argc() | NERDTree | endif

