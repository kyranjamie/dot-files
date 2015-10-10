"
" Define plugins 
" __________________________________________________________________________
 
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'statianzo/vim-jade'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jelera/vim-javascript-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chase/vim-ansible-yaml'
Plug 'mileszs/ack.vim'
" Plug 'qualiabyte/vim-colorstepper'
Plug 'Yggdroot/indentLine'
call plug#end()




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

" UTF-8 on
set encoding=utf-8

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

" Directory of back up files
set backupdir=~/.vim/backup-files

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

" Fewer alerts
set hidden

" Reload changed files
set autoread

" Better serach
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

filetype plugin indent on

" Detect markdown files
au BufRead,BufNewFile *.md set filetype=markdown




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
map <leader>n <plug>NERDTreeToggle<CR>

" Ctrl n to toggle sidebar
map <C-n> :NERDTreeToggle<CR>

" Force list style of :E
let g:netrw_liststyle=3

" Disable markdown code folding
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1


"
" Font settings
" __________________________________________________________________________


set guifont=Source_Code_Pro_for_Powerline

"
" Colour themes
" __________________________________________________________________________

" Set theme
" colorscheme Tomorrow-Night
" colorscheme spacegray
set t_Co=256
colorscheme PaperColor
set background=dark

let g:gitgutter_realtime = 1
let g:airline_powerline_fonts = 1

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'


