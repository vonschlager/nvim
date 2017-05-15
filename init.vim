call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-go', { 'do': 'make' }

call plug#end()

set t_cl=
set t_Co=256

filetype plugin indent on

set ttyfast
set lazyredraw

set background=dark
set cursorline
set expandtab
set fileencodings=utf8,iso-8859-2
set mouse=a
set noautochdir
set nopaste
set noshowmode
set number
set relativenumber
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set foldmethod=indent
set nofoldenable

colorscheme solarized

set nobackup
set nowritebackup
set noswapfile

set undofile
set undodir=$HOME/.vim/undo

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=t  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L

set guifont=Inconsolata\ Medium\ 12

set completeopt-=preview
set completeopt+=noselect

nnoremap Q <nop>
nnoremap Y y$

nnoremap <S-h> :MBEbp<CR>
nnoremap <S-l> :MBEbn<CR>

autocmd FileType go nmap <C-[> <Plug>(go-info)

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

let NERDTreeMinimalUI=1

let g:acp_enableAtStartup=0

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_camel_case_completion=1
let g:deoplete#enable_underbar_completion=1
let g:deoplete#enable_smart_case=1
if !exists('g:deoplete#sources#omni#input_patterns')
  let g:deoplete#sources#omni#input_patterns = {}
endif
let g:deoplete#sources#omni#input_patterns.php='[^. \t]->\h\w*\|\h\w*::'
let g:deoplete#sources#omni#input_patterns.javascript='[^. *\t]\.\w*\|\h\w*::'
let g:deoplete#sources#omni#input_patterns.elm='\.'

let g:deoplete#sources#go#gocode_binary='/home/jacek/go/bin/gocode'
let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let mapleader="\<Space>"

nmap <Leader>w :w<CR>
nmap <Leader>q :qall<CR>
nmap <Leader>b :MBEToggle<CR>
nmap <Leader>t :NERDTreeToggle<CR>

nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>

"CtrlP
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$|\v[\/]node_modules$|\v[\/](elm-stuff|deps|priv|_build)$',
\ }

"XDEBUG
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options["server"] = "192.168.100.37"
let g:vdebug_options["path_maps"] = {"/home/jlehmann/DEV/middleware": "/mnt/dev/middleware"}
let g:vdebug_options["ide_key"] = 'XDEBUG_VIM'

"Ack
let g:ackprg = 'ag --vimgrep'

"minibufexpl
let g:miniBufExplVSplit=20
let g:miniBufExplorerAutoStart=0

"airline
let g:airline_extensions = ['branch', 'tabline', 'neomake']
let g:airline_section_z = '%p%% %c|%l/%L'
let g:airline_symbols_ascii=1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

"neomake
let g:neomake_message_sign={
  \ 'text': 'M',
  \ 'texthl': 'MessageMsg',
  \ }
let g:neomake_info_sign={
  \ 'text': 'I',
  \ 'texthl': 'InfoMsg',
  \ }
let g:neomake_warning_sign={
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign={
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
let g:neomake_php_phpcs_args_standard='PSR2'
let g:neomake_php_enabled_makers=['phpcs','php']
autocmd! BufWritePost,BufEnter * Neomake

"rainbow
let g:rainbow_active=1

"elm
let g:elm_format_autosave=1
let g:elm_setup_keybindings=0
