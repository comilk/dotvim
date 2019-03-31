
call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'

Plug 'joshdick/onedark.vim'
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

"esaymotion
Plug 'Lokaltog/vim-easymotion'

"airline
set laststatus=2
set noshowmode
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='onedark'
let g:airline#extensions#ale#enabled = 1

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
autocmd FileType go nmap <leader>r  :GoDecls<cr>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace' , { 'for': 'clojure' }
Plug 'guns/vim-sexp' , {'for': ['clojure', 'scheme', 'lisp'] } | Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'scheme', 'lisp']}

Plug 'eraserhd/parinfer-rust', {'for': ['clojure', 'scheme', 'list']}

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"

au Syntax clojure,racket,lisp,scheme RainbowParenthesesActivate
au Syntax clojure,racket,lisp,scheme RainbowParenthesesLoadRound
au Syntax clojure,racket,lisp,scheme RainbowParenthesesLoadSquare
au Syntax clojure,racket,lisp,scheme RainbowParenthesesLoadBraces

"vim-sexp will provider auto closing, so disable delimitMate
au FileType clojure,racket,lisp,scheme let b:loaded_delimitMate = 1

Plug 'qpkorr/vim-bufkill'
cmap bd BD

Plug 'junegunn/vim-peekaboo'

call plug#end()


filetype plugin indent on  " 文件类型插件
syntax on       " 语法高亮
set synmaxcol=3000

"APPEARENCE
set nocompatible    " 关闭兼容模式
set t_Co=256
colorscheme onedark
set fileencodings=utf8,gb2312,gb18030,ansi
set number		" 显示行号
set cursorline
set guifont=Souce_Code_Pro:h12


"FUNCTION
autocmd! bufwritepost .vimrc source ~/.vimrc
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l "退格键和方向键可以换行
set incsearch       " 增量式搜索
set hlsearch        " 高亮搜索
set ignorecase      " 搜索时忽略大小写
set smartcase	    "搜索时如果全部小写，则忽略大小写
"set magic           " h magic吧
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
set noswapfile
set wildmenu
set wildmode=list:longest,full
set mouse=a
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
if has("nvim")
  set inccommand=split
endif

"SHORTCUT
nmap <leader>l :setlocal number!<CR>
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
  tnoremap <Esc> <C-\><C-n>
endif

" CDC = Change to Directory of Current file
command! CDC cd %:p:h

"LANGUAGE
set completeopt=longest,menu,preview

autocmd FileType python nnoremap <buffer> <F9> <ESC>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd filetype crontab setlocal nobackup nowritebackup

autocmd filetype clojure,racket set lisp

" Removes trailing spaces
command! TrimWhiteSpace %s/\s\+$//e
augroup trim_white_space
  autocmd!
  autocmd BufWritePre *.js :TrimWhiteSpace
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

