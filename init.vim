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
  call dein#add('tpope/vim-eunuch')
  call dein#add('Shougo/dein.vim')
  call dein#add('w0rp/ale')
  call dein#add('morhetz/gruvbox')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('google/yapf')
  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('diepm/vim-rest-console')
  call dein#add('editorconfig/editorconfig-vim')

  " Python
  call dein#add('vim-python/python-syntax')

  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')

  " Go
  call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go', { 'build': 'make' })
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-vim')

  call dein#end()
  call dein#save_state()
endif

" General settings
set mouse=a
syntax enable
set autoread
set nu
set cursorline
set ignorecase
set smartcase
set wildmode=longest,list,full
set mouse=a

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" fold control
set foldmethod=indent
set foldnestmax=1
set foldlevel=0
nnoremap <space> za

" Windows splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab - Space indent behavior
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Visual stuff
set colorcolumn=80,100,120
set listchars=eol:$,trail:~,extends:>,tab:>\ ,precedes:<
set list
let g:airline_powerline_fonts = 0
let g:is_bash = 1

" Strip trailing whitespace for these filetypes
autocmd FileType elixir,c,cpp,java,php,sh,zsh,python,vim autocmd BufWritePre <buffer> %s/\s\+$//e

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=dark

" Filetypes
autocmd FileType vim,yaml,elixir setl sw=2 sts=2 ts=2

" Code formatting for python
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>
let g:python_highlight_all = 1

filetype plugin indent on

" Shortcuts / Keybinds
let mapleader=","
nnoremap <Leader>cef :%y+<CR>
vnoremap <Leader>Y "+y<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>Q :wqa<CR>
nnoremap <Leader>o <C-o>
nnoremap <Leader>i <C-i>
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
" FZF settings
"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1


map <C-p> :Files<CR>
map <Leader>g :Buffers<CR>

"
" Ale settings
"
let g:ale_python_isort_executable = '/usr/bin/isort'
let g:ale_python_isort_use_global = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 'on_save'
let g:ale_lint_on_enter = 1
let g:ale_pattern_options = {'^fugitive:[\\/][\\/]': {'ale_enabled': 0}}
let g:ale_linters = {
\  'python': ['flake8', 'isort', 'pylint'],
\  'elixir': ['credo', 'dogma']
\}

nmap <silent> ]e <Plug>(ale_previous_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

"
" NERDTree
"

" When entering vim with no arguments, start NERDTree
au vimenter * if !argc() | NERDTree | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
