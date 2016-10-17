"ORDER MATTERS

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle required! 
Plugin 'gmarik/Vundle.vim'

"COLOR  SCHEME
Plugin 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']

Plugin 'surround.vim'
Plugin 'scrooloose/nerdcommenter'

"nerdtree
Plugin 'scrooloose/nerdtree'
:nmap <F7> :NERDTreeToggle<CR>
:nmap <leader>t :NERDTreeToggle<CR>

"tagbar
Plugin 'vim-scripts/Tagbar'
let g:tagbar_left = 0
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'js'
\ }

"ack & ag
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'

"Ctrl-P
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_buftag_types = {'javascript': '--language-force=js'}
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:30'
noremap <leader>p :CtrlPBufTag<CR>
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    "ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_completion = 1

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
Plugin 'honza/vim-snippets'

Plugin 'raimondi/delimitmate'
let delimitMate_expand_cr = 1

"esaymotion
Plugin 'Lokaltog/vim-easymotion'

"airline
set laststatus=2
set noshowmode
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='badwolf'

"Auto indent detect
Plugin 'tpope/vim-sleuth'

"indent guide
"will set conceallevel to 2, which is bad for JSON file. Use vim-json to fix.
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plugin 'severin-lemaignan/vim-minimap'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'

"Language support
"Plugin 'php.vim'
"Plugin 'vim-scripts/SQLComplete.vim'

"Plugin 'digitaltoad/vim-jade'

"javascript
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plugin 'fatih/vim-go'

"clojure
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" All of your Plugins must be added before the following line
call vundle#end()


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

au BufEnter *.clj RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces
au Syntax clojure let g:loaded_delimitMate = 0

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
