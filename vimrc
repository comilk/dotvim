
call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'

Plug 'joshdick/onedark.vim'
if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("MatchParen", {"bg": {"cterm": "darkgrey", "gui": "#5c6370"}})
  augroup END
endif

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'w0rp/ale'
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['gometalinter', 'gofmt']
\}
let g:ale_go_gometalinter_options='--fast'

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

"nerdtree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

Plug '~/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap q: :History:<cr>

Plug 'autozimu/LanguageClient-neovim', {  'branch': 'next',  'do': 'bash install.sh'  }
let g:LanguageClient_serverCommands = {
    \ }

augroup lsp_mapping
  autocmd filetype js nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  autocmd filetype js nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  autocmd filetype js nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  autocmd filetype js nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
augroup END

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go'
Plug 'clojure-vim/async-clj-omni'
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

Plug 'raimondi/delimitmate'
let delimitMate_expand_cr = 1
"vim-sexp will provider auto closing, so disable delimitMate
au FileType clojure,racket,lisp,scheme let b:loaded_delimitMate = 1

Plug 'Lokaltog/vim-easymotion'

"airline
set laststatus=2
set noshowmode
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='onedark'

"Auto indent detect
Plug 'tpope/vim-sleuth'

"indent guide
"will set conceallevel to 2, which is bad for JSON file. Use vim-json to fix.
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'

Plug 'dhruvasagar/vim-table-mode'

Plug 'editorconfig/editorconfig-vim'

Plug 'digitaltoad/vim-jade'

"javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode="gopls"

"let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_updatetime = 2500
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r :GoDecls<cr>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


Plug 'junegunn/rainbow_parentheses.vim'
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

Plug 'tpope/vim-fireplace' , { 'for': 'clojure' }
autocmd FileType clojure nmap <buffer> gd <Plug>FireplaceDjump
autocmd FileType clojure nmap <buffer> <CR> cpp
Plug 'guns/vim-sexp' , {'for': ['clojure', 'scheme', 'lisp'] } | Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'scheme', 'lisp']}
" let parinfer insert the parentheses
let g:sexp_enable_insert_mode_mappings = 0

Plug 'eraserhd/parinfer-rust', {'for': ['clojure', 'scheme', 'lisp', 'racket']}

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"

Plug 'Olical/vim-scheme', {'on': 'SchemeConnect'}
let g:scheme_executable = "racket -i -l xrepl -I sicp"

Plug 'qpkorr/vim-bufkill'
cmap bd BD

Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'wlangstroth/vim-racket'

call plug#end()


filetype plugin indent on
syntax on

"APPEARENCE
set nocompatible
set t_Co=256
colorscheme onedark
set fileencodings=utf8,gb2312,gb18030,ansi
set number
set cursorline
set guifont=Souce_Code_Pro:h12


"FUNCTION
autocmd! bufwritepost .vimrc source ~/.vimrc
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent
set backspace=eol,start,indent
set incsearch
set hidden
"set whichwrap+=<,>,h,l
set hlsearch
set ignorecase
set smartcase
set showmatch
set nobackup
set noswapfile
set wildmenu
set wildmode=list:longest,full
set mouse=a
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set foldmethod=indent
set foldlevelstart=20
if has("nvim")
  set inccommand=split
endif

"SHORTCUT
nmap j gj
nmap k gk
cmap w!! w !sudo tee %
map <space> <leader>
map <space><space> <leader><leader>
imap <c-d> <del>

vnoremap > >gv
vnoremap < <gv

inoremap jk <esc>
inoremap kj <esc>

" change cursor position in insert mode
inoremap <C-f> <Right>
inoremap <C-l> <Right>
inoremap <C-b> <Left>
inoremap <C-h> <Left>

nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y

if has("nvim")
  "tnoremap <Esc> <C-\><C-n>
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif

" CDC = Change to Directory of Current file
command! CDC cd %:p:h

"LANGUAGE
set completeopt=longest,menuone,preview

autocmd FileType python nnoremap <buffer> <F9> <ESC>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd filetype crontab setlocal nobackup nowritebackup

" use / as word delimiter
autocmd filetype clojure set iskeyword-=/

" Removes trailing spaces
command! TrimWhiteSpace %s/\s\+$//e
command! TrimWhiteSpaceOnSave autocmd BufWritePre * :TrimWhiteSpace
augroup trim_white_space
  autocmd!
  autocmd BufWritePre *.js,*.clj,*.cljs,*.cljc :TrimWhiteSpace
augroup END

function! SetIndent(i)
    let &shiftwidth = a:i
    let &softtabstop = a:i
endfunction

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

