set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'junegunn/vim-easy-align'
Plugin 'nathangrigg/vim-beancount'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-rhubarb'
Plugin 'rodjek/vim-puppet'
Plugin 'rizzatti/dash.vim'
Plugin 'fatih/vim-go'
Plugin 'kaicataldo/material.vim'
Plugin 'vim-vdebug/vdebug'

call vundle#end()

" Set leader to comma
let mapleader=","

" Enable syntax highlighting
syntax on

" Enable material theme
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
let g:lightline = { 'colorscheme': 'material_vim' }
let g:material_theme_style = 'ocean'
colorscheme material
set cc=""
let g:vim_jsx_pretty_colorful_config = 1
let g:jsx_ext_required = 0

" Add ESLint and Prettier
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_php_phpcs_standard='/Volumes/cAseSensitive/mailchimp/vendor/rsg/mc-codesniffer-ruleset/MCStandard --exclude=Generic.Files.LineLength,Squiz.WhiteSpace.SuperfluousWhitespace -d memory_limit=-1'
let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Enable filetype detection. Disabled by default on some Linux distros.
filetype plugin indent on

" Display line numbers
set number

" Set a visual indicator for line wrap
set colorcolumn=

" Move around buffers
nmap <leader>. :bprevious<cr>
nmap <leader>/ :bnext<cr>

" Delete trailing whitespace on file save
autocmd BufWritePre * %s/\s\+$//e

" Set document width to 80 characters, but don't autowrap
set textwidth=80
" set nowrap

" Show 7 lines above/below the cursor
set scrolloff=7

" Case insensitive search for lowercase query, case sensitive for mixed case
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Turn off backups/swap files, I find them useless/annoying.
set nobackup
set nowritebackup
set noswapfile

" Switch buffers without saving
set hidden

" Use 4 spaces instead of 1 tab
set shiftwidth=4
set tabstop=4
set expandtab

" Use spacebar to search
nmap <space> /

" Disable highlights from search via ,<enter>
nmap <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Pressing ,ss will toggle and untoggle spell checking
nmap <leader>ss :setlocal spell!<cr>

" Fast edit vimrc
nmap <leader>e :e ~/.vimrc<cr>

" Persistent undo history
try
    set undodir=~/.logs/vim-undodir
    set undofile
catch
endtry

" Goyo (distraction free editing) shortcut
nmap <silent> <leader>zz :Goyo<cr>

" Disable obnoxious error bells
set noerrorbells visualbell t_vb=

" Copy/paste to system clipboard
nmap <leader>yy "*yy
vmap <leader>yy "*y
nmap <leader>dd "*dd
vmap <leader>dd "*d
map <leader>PP "*P
map <leader>pp "*p

" Fast saving
nmap <leader>w :w<cr>
imap <leader>ww <esc>:w<cr>

" Change working directory to current file path
nmap <leader>cd :cd %:p:h<cr>

" Configure certain filetypes to indent two spaces instead of 4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype beancount setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Switch 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" Stop vim-markdown and vim-beancount from folding
let g:vim_markdown_folding_disabled = 1
let g:vim_beancount_folding_disabled = 1

" Remap Y to be consistent with D, C, etc
nmap Y y$

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Highlight php @params, etc. inside docblocks
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" Q normally drops you into Ex mode. Nobody wants that.
map Q <Nop>

" Used to use Ctrl-P but switched to fzf for better days
nmap <c-p> :GFiles<cr>

" for tpope/vim-rhubarb
let g:github_enterprise_urls = ['https://git.rsglab.com']

" For speed on large files, don't lint on text change or on fopen

