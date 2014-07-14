" Load Pathogen
execute pathogen#infect()




"
" General VI mappings
" __________________________________________________________________________

" Map leader to ,
let mapleader=","

" jj maped to ESC
imap jj <Esc>

" Shift+Tab unindents a line
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" Show trailing white space
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"
" General VI settings
" __________________________________________________________________________

" Highlighting
syntax on

" Padding around cursor and window edge
set scrolloff=8

" History force more
set history=1000

" Hide NERDTree scrollbar
set guioptions-=L

" Hide MacVim gui elements
set guioptions-=T
set guioptions-=r

" Line numbers
set number

" Set ruler
set ruler

" Set xterm title
set title

" Enable mouse in terminal
set mouse=a

set showcmd

" Disable error sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Ignore case when searching
set ignorecase

" Show tab line
set showtabline=2
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set nowritebackup
set noswapfile

" Fewer alerts
set hidden
set autoread

" Better serach
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

filetype plugin indent on


"
" NERDtree
" https://github.com/scrooloose/nerdtree
" https://github.com/jistr/vim-nerdtree-tabs
" __________________________________________________________________________

" Auto load NERDtree
" autocmd vimenter * NERDTree

" Open NERDtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show hidden files by default / Shift+i
let NERDTreeShowHidden=1

" map leader to toggle NERDtree
" map <leader>n :NERDTreeToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>

" Ctrl n to toggle sidebar
map <C-n> :NERDTreeToggle<CR>

" Force list style of :E
let g:netrw_liststyle=3

" Disable markdown code folding
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1




"
" Colour themes
" __________________________________________________________________________

" Set theme
colorscheme Tomorrow-Night

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

let g:gitgutter_realtime = 1
