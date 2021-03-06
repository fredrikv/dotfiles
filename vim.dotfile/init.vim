" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


Plug 'joonty/vdebug', { 'branch': 'master' }
if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
" let g:vdebug_options["break_on_open"] = 0
" let g:vdebug_options["continuous_mode"] = 1


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <silent> <C-n> :NERDTreeToggle<CR>


Plug 'scrooloose/nerdcommenter'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" At the time of writin (2018-04-15), git@github.com:universal-ctags/ctags.git
" seems to be the version of ctags that generates the most accurate results
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
" let g:phpcomplete_parse_docblock_comments = 1

Plug 'joonty/vim-taggatron'
let g:tagcommands = {
\    "php" : {"tagfile":".php.tags","args":"-R","cmd":"ctags"},
\    "javascript" : {"tagfile":".js.tags","args":"-R","cmd":"ctags"},
\    "python" : {"tagfile":".py.tags","args":"-R","cmd":"ctags"}
\}
let g:taggatron_verbose = 0
Plug 'joonty/vim-phpqa', { 'for': 'php' }
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codecoverage_autorun = 0
let g:phpqa_codecoverage_file = "coverage.xml"

Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

Plug 'majutsushi/tagbar'
" autocmd VimEnter * nested :call tagbar#autoopen(0)
" autocmd FileType * nested :call tagbar#autoopen(0)
" autocmd BufEnter * nested :call tagbar#autoopen(0)
nmap <C-s> :TagbarToggle<CR>

" avoid quickfix list to open below tagbar
augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end



Plug 'mbbill/undotree'


" PHP
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"


" Git
Plug 'tpope/vim-fugitive'
set diffopt+=vertical
:nnoremap <Leader>gc :Gcommit -v<CR>
:nnoremap <Leader>gs :Gstatus<CR>
:nnoremap <Leader>gw :Gwrite<CR>
:nnoremap <Leader>gd :Gdiff<CR>
:nnoremap <Leader>gb :Gblame -w<CR>
:nnoremap <Leader>gf :Gfetch<CR>

Plug 'airblade/vim-gitgutter'
let g:gitgutter_diff_args = '--ignore-all-space'



Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'


Plug 'stephpy/vim-php-cs-fixer'
let g:php_cs_fixer_path = "php-cs-fixer"

Plug 'w0rp/ale'

" Snippets
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'sniphpets/sniphpets'
Plug 'sniphpets/sniphpets-symfony'
Plug 'arnaud-lb/vim-php-namespace'

"Plugin 'xolox/vim-easytags'
"let g:easytags_async = 1
Plug 'xolox/vim-misc'
Plug 'evidens/vim-twig'
Plug 'jaxbot/semantic-highlight.vim'
:nnoremap <Leader>s :SemanticHighlightToggle<cr>

Plug 'sheerun/vim-polyglot'



Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '.git\|cache\|web',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_clear_cache_on_exit = 0


let g:ctrlp_working_path_mode = 'r'
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
"
" " Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

"
" Styling
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'flattown'

Plug 'blerins/flattown'


Plug 'vim-scripts/LargeFile'

Plug 'goldfeld/vim-seek'
let g:seek_subst_disable = 1
"let g:seek_enable_jumps = 1
"let g:seek_enable_jumps_in_diff = 0

" Initialize plugin system
call plug#end()

" Search
set grepprg=ack
" Find word under cursor (small search)
:nnoremap <Leader>fw :grep! --ignore-directory=vendor "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Find text in clipboards (small search)
:nnoremap <Leader>fp :grep! --ignore-directory=vendor "\b<C-R><C-R>+\b"<CR>:cw<CR><CR>

:nnoremap <Leader>ff :grep! --ignore-directory=vendor "\b\b"<LEFT><LEFT><LEFT>




" Find word under cursor (large search)
:nnoremap <Leader>Fw :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Find text in clipboards (large search)
:nnoremap <Leader>Fp :grep! "\b<C-R><C-R>+\b"<CR>:cw<CR><CR>




" SETTINGS
set number
set relativenumber
set cursorline
nnoremap <space> za

set hlsearch
set incsearch

colorscheme flattown
syntax on

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 91)

exec "set listchars=tab:\uB7\uB7,nbsp:~,trail:\uB7"
set list

set hidden
set ignorecase
set smartcase

set mouse=

" Read folder specific .vimrc
if filereadable(".vimrc") && fnamemodify(".vimrc", ":p") != fnamemodify("~/.vimrc", ":p")
    source .vimrc
endif
