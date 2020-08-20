call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '5.1' }
Plug 'Shougo/denite.nvim'

Plug 'https://github.com/morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'

" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'janko/vim-test'
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
Plug 'AndrewRadev/splitjoin.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'lyokha/vim-xkbswitch'
call plug#end()

" Colorscheme
colorscheme gruvbox
syntax enable
set background=dark
" colorscheme solarized

filetype plugin indent on
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set number
set nocompatible

filetype plugin indent on

au FocusLost User :wa

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

set nopaste

" Advanced
set ruler " Show row and column ruler information
set inccommand=split
:set hls! " Toggle highlighting after the search

set autowriteall  " Auto-write all file changes

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd

set timeoutlen=1000
set ttimeoutlen=0

" More symbols on the line
set tw=500

" Set regex engine manually
set regexpengine=1

" Show dots with indents
set list listchars=tab:\ \ ,trail:·

" Highlight current column
set cuc cul"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Wipe the registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" No sessions autosave
let g:session_autosave = 'no'

" path to python interpreter
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog='/usr/local/bin/python3'

" Narrow window
let g:nrrw_rgn_vert = 1

" Crontab settings
autocmd filetype crontab setlocal nobackup nowritebackup


" ==== MAPPINGS ====
" Remove arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Splits navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tabs
nnoremap TN :tabnew<CR>
nnoremap TQ :tabclose<CR>
nnoremap TE :tabe %<CR>
nnoremap TO <C-w>T

nnoremap RS :set syntax=ruby<CR>
nnoremap RB :! nohup rubocop -a % &<CR><CR>
nnoremap FC :! cat % \| pbcopy &<CR><CR>

" Buffers
nnoremap <Tab>n :buffers<CR>:buffer<SPACE>

" Remap escape to jj
inoremap jj <ESC>
inoremap оо оо

" Search visual selection
vnoremap // y/<C-R>"<CR>

" Swap current line and bottom line
map - ddp
" Swap current line and upper line
map _ kddpk

" Use : instead of ;
nmap ; :

" \\ to navigate last to open files
nnoremap <leader><leader> <c-^>

nnoremap <Leader>q :CloseOtherBuffers<CR>
" Copy current file path to the system buffer
nmap cp :let @* = expand("%")<CR>
" Copy current line to system buffer
nmap <leader>Y "*yy


"==== PLUGINS ====
" FZF config
map <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND='ag -g ""'

" Deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Ack.vim config
let g:ackprg = 'ag --nogroup --nocolor --column'

" Not jump to the first result with search
cnoreabbrev ag Ack!
nnoremap <Leader>a :Ack!<Space>

" Open Buffer Explorer
nnoremap <Leader>b :BufExplorer<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%*

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files in NerdTree
let NERDTreeCascadeSingleChildDir=0 " Remove one-child dirs collapsing
" NerdTree UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-n> :NERDTreeToggle<CR>
map ,n :NERDTreeFind<CR>

" Ale settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = { 'ruby': ['rubocop'] }
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'

" vim-test mappings
" map <Leader>l :TestLast<CR>
map <Leader>l :call RunCustomSpec('TestLast')<CR>
map <Leader>s :call RunCustomSpec('TestNearest')<CR>
map <Leader>f :call RunCustomSpec('TestFile')<CR>
let test#strategy = "basic"

" Vim markdown settings
let g:markdown_fenced_languages = ['json=javascript', 'ruby']
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_folding_disabled = 1

" Vim goyo
let g:goyo_width = 160

" Enable russian vim mappings
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']


" ==== FUNCTIONS ====
" Parent dir/subdir navigation for running different gems specs
function! CdToSpecDir()
  let spec_index = index(split(expand("%:p"), "/"), "spec")
  let target_index = spec_index - 1
  let path = "/" . join(split(expand('%:p'), "/")[0:target_index], "/")

  execute 'lcd' fnameescape(path)
  pwd
endfunction

function! CdToParentDir()
  lcd ../
  pwd
endfunction

function! RunCustomSpec(command)
  call CdToSpecDir()
  execute(a:command)
endfunction

nmap <leader>w :call CdToSpecDir()<CR>
nmap <leader>e :call CdToParentDir()<CR>

" Lexy call to open spec file for current class
function! SpecFileFor(path)
  let cmd = "lexy find_spec_file " . a:path . " 2> /dev/null"
  let spec_file = system(cmd)

  execute("e " . spec_file)  
endfunction

nmap SF :call SpecFileFor(expand("%:p"))<CR>

function! AgUnderCursor()
  let cmd = 'Ack! ' . expand('<cword>')

  execute(cmd)
endfunction
nmap <leader>g :call AgUnderCursor()<CR>
