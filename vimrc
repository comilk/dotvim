"APPEARENCE
set nocompatible    " 关闭兼容模式
set t_Co=256
"set background=dark
colorscheme lucius
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030
set number		" 显示行号
set cursorline

if has("gui_running")
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
set ignorecase      " 搜索时忽略大小写
"set magic           " h magic吧
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
"set backupdir=.,/tmp
"set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
"set lbr             " 在breakat字符处而不是最后一个字符处断行
"set si              " 智能缩进

"SHORTCUT
inoremap <C-F> <Right>
inoremap <C-B> <Left>

"LANGUAGE
execute pathogen#infect()
syntax on       " 语法高亮
filetype plugin on  " 文件类型插件
filetype indent on
set completeopt=longest,menu
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99


"PLUGIN SETTINGS

"nerdtre


"tagbar
nmap <F8> :TagbarToggle<CR>
