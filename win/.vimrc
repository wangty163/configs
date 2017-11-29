" 启动时候全屏
autocmd GUIEnter * simalt ~x

" 去除工具栏
:set guioptions-=T

" 删除键可以删空白行
set nocompatible
set backspace=indent,eol,start









"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         编码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8 
"set langmenu=zh_CN.UTF-8 language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1








"""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"                     个人配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set rnu      "relative number
set acd     "autochdir
set si      "smartindent  
set ts=4    "tabstop=4  
set sw=4    "shiftwidth=4  
set et      "expandtab  
set sts=4   "softtabstop=4  

syntax on
filetype plugin indent on 
"terminal Color
set t_Co=256 



if has('gui_running')
    set background=dark
    colorscheme evening
else
    set background=dark
    colorscheme desert
endif

set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap { {}<ESC>i<CR><ESC>O
imap {<CR> {}<ESC>i<CR><ESC>O
"set pastetoggle=<F12>
map <F12> :call TogglePaste() <CR>
map! <F12> <ESC> :call TogglePaste() <CR>
func! TogglePaste()
	if &rnu == 1
        exec ":set invpaste paste"
    else
        exec ":set invpaste nopaste"
    endif
    exec "se rnu!"
endfun
"nnoremap <F12> :set invpaste paste?<CR>
"imap <F12> <C-O>:set invpaste paste?<CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	                一键编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F9> :call CompileRun()<CR>
imap <F9> <ESC>:call CompileRun()<CR>
func! CompileRun()
exec "w"
    if expand('%:e') == "c"
        exec "!gcc -std=c++11 % -o %<.exe && %<.exe"
    elseif expand('%:e') == "cpp" || expand('%:e') == "cc"
        exec "!g++ -std=c++11 % -o %<.exe && %<.exe"
    elseif expand('%:e') == "java"
        exec "!javac % && java %:r"
    elseif expand('%:e') == "py"
        exec "!py %"
    elseif expand('%:e') == "sh"
        exec "!./%"
    endif
endfun
