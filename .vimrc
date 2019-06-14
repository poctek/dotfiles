call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/denite.nvim'

Plug 'https://github.com/altercation/vim-colors-solarized.git'

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Asheq/close-buffers.vim'
Plug 'junegunn/vim-easy-align'

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'nathanaelkane/vim-indent-guides'
Plug 'rhysd/committia.vim'

Plug 'w0rp/ale'

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'zenbro/mirror.vim'

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
" NerdTree UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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
set inccommand=split

set autowriteall  " Auto-write all file changes

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd

" Wipe the registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" path to python interpreter
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'

let g:python_host_prog = '/usr/local/bin/python3'

:set hls! " toggle highlighting after the search

" Syntastic settings
" let g:syntastic_ruby_checkers = ['rubocop']

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

nnoremap RS :set syntax=ruby<CR>
nnoremap RB :! nohup rubocop -a % &<CR><CR>

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

" Open Buffer Explorer
nnoremap <Leader>b :BufExplorer<CR>

" Slim filetype
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Set regex engine manually
set regexpengine=1

" No sessions autosave
let g:session_autosave = 'no'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Narrow window
let g:nrrw_rgn_vert = 1

nnoremap <Leader>q :CloseOtherBuffers<CR>

" Ale settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = { 'ruby': ['rubocop'] }
let g:ale_fix_on_save = 1

set timeoutlen=1000
set ttimeoutlen=0

nmap cp :let @* = expand("%")<CR>
nmap rb :! rubocop -a %<CR>

" With deoplete.nvim
let g:monster#completion#backend = 'solargraph'
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

let @s = "cs\"'"
let @a = 'cs[)'
let @c = 'ggvG$y'

let g:python3_host_prog='/usr/local/bin/python3'
