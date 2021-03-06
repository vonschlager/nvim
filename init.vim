call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf', { 'do': './install --no-key-bindings --no-completion --no-update-rc' } " only install fzf for vim
Plug 'junegunn/fzf.vim'
Plug 'ElmCast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'jiangmiao/auto-pairs'
Plug 'jodosha/vim-godebug'
Plug 'lifepillar/vim-solarized8'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'zchee/deoplete-go', { 'do': 'make' }

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'roxma/nvim-completion-manager'
Plug 'junegunn/gv.vim'

call plug#end()

filetype plugin indent on

set lazyredraw

set background=dark
set cursorline
set expandtab
set fileencodings=utf8,iso-8859-2
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
set smartcase
set nocursorcolumn
set mouse=a
set title
set termguicolors
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
set hidden "for language server

colorscheme solarized8_dark

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

set completeopt-=preview
set completeopt+=noselect

let NERDTreeMinimalUI=1

let g:acp_enableAtStartup=0

"call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
"let g:deoplete#enable_at_startup=1
"let g:deoplete#enable_camel_case_completion=1
"let g:deoplete#enable_underbar_completion=1
"let g:deoplete#enable_smart_case=1
"if !exists('g:deoplete#sources#omni#input_patterns')
"  let g:deoplete#sources#omni#input_patterns = {}
"endif
"let g:deoplete#sources#omni#input_patterns.php='[^. \t]->\h\w*\|\h\w*::'
"let g:deoplete#sources#omni#input_patterns.javascript='[^. *\t]\.\w*\|\h\w*::'
"let g:deoplete#sources#omni#input_patterns.elm='\.'
"
"let g:deoplete#sources#go#gocode_binary='/home/jacek/go/bin/gocode'
"let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let mapleader="\<space>"

nnoremap Q <nop>
nnoremap Y y$

nnoremap <S-h> :MBEbp<CR>
nnoremap <S-l> :MBEbn<CR>

nnoremap <C-p> :FZF<CR>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <Leader>w :w<CR>
nmap <Leader>q :qall<CR>
nmap <Leader>b :MBEToggle<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap - <Plug>(choosewin)

nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>

"CtrlP
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$|\v[\/]node_modules$|\v[\/](elm-stuff|deps|priv|_build|vendor)$',
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

"ultinips
let g:UltiSnipsExpandTrigger="<a-j>"
let g:UltiSnipsJumpForwardTrigger="<a-h>"
let g:UltiSnipsJumpBackwardTrigger="<a-l>"

"vim-go
let g:go_auto_type_info=1
let g:go_fmt_command="goimports"
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
let g:go_addtags_transform="snakecase"
let g:go_snippet_engine="ultisnips"

"go
au FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType go nmap <C-[> <Plug>(go-info)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

"php
autocmd FileType php LanguageClientStart
