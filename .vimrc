set number
execute pathogen#infect()
filetype plugin indent on
syntax on

" New tab abbrevs
command Nt tabnew
command Tn tabnext
command Tp tabprevious

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
filetype plugin indent on
" Show hidden files in NerdTree
let NERDTreeShowHidden=1

au FocusLost * :wa

map <C-n> :NERDTreeToggle<CR>

"  General
set relativenumber  
set linebreak 
set showbreak=+++ 
set textwidth=100 
set showmatch " Highlight matching brace
set visualbell  " Use visual bell (no beeping
 
set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch " Searches for strings incrementally
 
set autoindent  " Auto-indent new lines
set shiftwidth=4  " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab  " Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab
 
"" Advanced
set ruler " Show row and column ruler information
 
set autowriteall  " Auto-write all file changes
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd

set runtimepath^=~/.vim/bundle/ctrlp.vim " For Ctrl-P plugin

:set hls! " toggle highlighting after the search

" Remove arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Remap escape to jj
inoremap jj <ESC>

" Show dots with indents
set list listchars=tab:\ \ ,trail:·

" Crontab settings
autocmd filetype crontab setlocal nobackup nowritebackup
