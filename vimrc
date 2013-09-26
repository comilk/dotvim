"APPEARENCE
set nocompatible    " 关闭兼容模式
set t_Co=256
"set background=dark
colorscheme lucius_dark
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ansi
set number		" 显示行号
set cursorline

if has("gui_running")
    colorscheme smyck
    set columns=88
    set lines=42
endif

"FUNCTION
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l "退格键和方向键可以换行
set incsearch       " 增量式搜索
"set nohlsearch
set hlsearch        " 高亮搜索
set smartcase	    "搜索时如果全部小写，则忽略大小写
"set ignorecase      " 搜索时忽略大小写
"set magic           " h magic吧
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
"set backupdir=.,/tmp
set noswapfile
"set lbr             " 在breakat字符处而不是最后一个字符处断行
"set si              " 智能缩进


"LANGUAGE
execute pathogen#infect()	
syntax on       " 语法高亮
filetype plugin indent on  " 文件类型插件
"filetype indent on
set completeopt=longest,menu
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99


"SHORTCUT
inoremap <C-F> <Right>
inoremap <C-B> <Left>
:nmap \l :setlocal number!<CR>
nmap j gj
nmap k gk
cmap w!! w !sudo tee % 


set pastetoggle=<F11>
"PLUGIN SETTINGS

"nerdtree
:nmap <F7> :NERDTreeToggle<CR>

"tagbar
let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>


"Ctrl-P
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"
"vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


"neocomplacache
let g:neocomplcache_enable_at_startup = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3


let b:delimitMate_matchpairs = "(:),[:],{:}"
nmap <F9> :DelimitMateSwitch<CR>


