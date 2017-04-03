"ORDER MATTERS

"Plug
call plug#begin('~/.vim/bundle')

"COLOR  SCHEME
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'morhetz/gruvbox'

Plug 'w0rp/ale'
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

Plug 'surround.vim'
Plug 'scrooloose/nerdcommenter'

"nerdtree
Plug 'scrooloose/nerdtree'
nmap <F7> :NERDTreeToggle<CR>
nmap <leader>t :NERDTreeToggle<CR>

"tagbar
Plug 'majutsushi/tagbar'
let g:tagbar_left = 0
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'js'
\ }

"ack & ag
Plug 'rking/ag.vim'

"Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_buftag_types = {'javascript': '--language-force=js'}
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:30'
noremap <leader>r :CtrlPBufTag<CR>
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    "ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

Plug 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_key_invoke_completion = '<c-/>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = { 'clojure': [ 're!\(\w\w\w' ], 'racket': [ 're!\(\w\w\w' ] }

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='badwolf'

"Auto indent detect
Plug 'tpope/vim-sleuth'

"indent guide
"will set conceallevel to 2, which is bad for JSON file. Use vim-json to fix.
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'

"Language support
"Plug 'php.vim'
"Plug 'vim-scripts/SQLComplete.vim'

"Plug 'digitaltoad/vim-jade'

"javascript
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"lisp
Plug 'kien/rainbow_parentheses.vim' 
Plug 'tpope/vim-fireplace' , { 'for': 'clojure' }
Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'
if has('nvim') 
  Plug 'neovim/node-host' | Plug 'markx/nvim-parinfer.js'
  let g:sexp_enable_insert_mode_mappings = 0
endif

Plug 'wlangstroth/vim-racket'
Plug 'jpalardy/vim-slime'
if ('nvim') 
  let g:slime_target = "tmux"
else
  let g:slime_target = "tmux"
endif
Plug 'MicahElliott/vrod', {'dir': '~/.vim/bundle/vim-racket-omni-docs'}

au Syntax clojure,racket,lisp RainbowParenthesesActivate
au Syntax clojure,racket,lisp RainbowParenthesesLoadRound
au Syntax clojure,racket,lisp RainbowParenthesesLoadSquare
au Syntax clojure,racket,lisp RainbowParenthesesLoadBraces
au Syntax clojure,racket,lisp let b:loaded_delimitMate = 1

call plug#end()


filetype plugin indent on  " 文件类型插件
syntax on       " 语法高亮
set synmaxcol=3000

"APPEARENCE
set nocompatible    " 关闭兼容模式
set t_Co=256
set background=dark
colorscheme gruvbox
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ansi
set number		" 显示行号
set cursorline
set guifont=Sauce_Code_Powerline:h12


"FUNCTION
autocmd! bufwritepost .vimrc source ~/.vimrc
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
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
set mouse=a
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

" smash escape
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

if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif

" CDC = Change to Directory of Current file
command! CDC cd %:p:h

"LANGUAGE
set completeopt=longest,menu,preview

set foldlevel=20
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 foldmethod=indent 
autocmd FileType python nnoremap <buffer> <F9> <ESC>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd FileType jade setlocal expandtab shiftwidth=2 softtabstop=2 foldmethod=indent 

autocmd FileType html*,xml setlocal expandtab shiftwidth=2 softtabstop=-1

autocmd filetype crontab setlocal nobackup nowritebackup

autocmd filetype clojure, racket set lisp

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileType javascript autocmd BufWritePre * :call TrimWhiteSpace()

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
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

