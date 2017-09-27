call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'https://github.com/altercation/vim-colors-solarized.git'

Plug 'Raimondi/delimitMate'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'brooth/far.vim'
Plug 'wellle/targets.vim'
Plug 'thoughtbot/vim-rspec'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'posva/vim-vue'

Plug 'fatih/vim-go'

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'zenbro/mirror.vim'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" Colorscheme
colorscheme solarized
set background=dark

filetype plugin indent on
syntax on
set t_Co=256

set number
set nocompatible

filetype plugin indent on

" Show hidden files in NerdTree
let NERDTreeShowHidden=1
" Remove one-child dirs collapsing
let NERDTreeCascadeSingleChildDir=0

au FocusLost User :wa

map <C-n> :NERDTreeToggle<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"  General
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch " Highlight matching brace
set visualbell  " Use visual bell (no beeping
set hidden
set nobackup
set noswapfile
set scrolloff=3
set regexpengine=1 " Old-style regex highlighting

set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set smartindent " Enable smart-indent
set expandtab
set tabstop=2 " Number of spaces per Tab
set shiftwidth=2  " Number of auto-indent spaces
set mouse-=a

" Advanced
set ruler " Show row and column ruler information

set autowriteall  " Auto-write all file changes

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd

" path to python interpreter
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

let g:python_host_prog = '/usr/bin/python'

" JavaScript libraries settings
let g:used_javascript_libs = 'jquery, angularjs, angularui, react'

" JSX highlighting
let g:jsx_ext_required = 0

:set hls! " toggle highlighting after the search

" Syntastic settings
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_jsx_checkers = ['eslint']
let g:syntastic_sass_checkers = ['scss_lint']

" Remove arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tabs
nnoremap TN :tabnew<CR>
nnoremap TQ :tabclose<CR>
nnoremap TE :tabe %<CR>
nnoremap TO <C-w>T

" Buffers
nnoremap <Tab>n :buffers<CR>:buffer<SPACE>

" Remap escape to jj
inoremap jj <ESC>

" Search visual selection
vnoremap // y/<C-R>"<CR>

" Show dots with indents
set list listchars=tab:\ \ ,trail:·

" Crontab settings
autocmd filetype crontab setlocal nobackup nowritebackup

" Swap current line and bottom line
map - ddp
" Swap current line and upper line
map _ kddpk

" Use : instead of ;
nmap ; :

" \\ to navigate last to open files
nnoremap <leader><leader> <c-^>

" ==== Ruby aliases ====
map <Leader>rs f:xi =>jj

" FZF config
map <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND='ag -g ""'

" More symbols on the line
set tw=500

" Highlight current column
set cuc cul"

" Snipets config
let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neosnippet config
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Ack.vim config
let g:ackprg = 'ag --nogroup --nocolor --column'

" Not jump to the first result with search
cnoreabbrev ag Ack!
nnoremap <Leader>a :Ack!<Space>

" Slim filetype
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Set regex engine manually
set regexpengine=1

" Airline caching speed up
let g:airline_highlighting_cache=1
