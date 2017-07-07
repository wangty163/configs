"""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"                     vundle配置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible              " be iMproved, required
filetype on                  " required

set cursorline
" foldermethod
" set fdm=indent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'project.tar.gz'
Bundle 'scrooloose/nerdtree'
Bundle 'ctags.vim'
Bundle 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

 




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

autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set background=dark
    "let g:solarized_termcolors=256
    "colorscheme solarized
    colorscheme desert
    "colorscheme default
endif





"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
nnoremap <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc', 'tags', 'nohup.out']
map<F11> :silent! NERDTreeToggle<CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   编码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8 
"set langmenu=zh_CN.UTF-8 language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1





"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap { {}<ESC>i<CR><ESC>O
imap {<CR> {}<ESC>i<CR><ESC>O
"set pastetoggle=<F12>
map <F12> :call TogglePaste() <CR>
map! <F12> <ESC> :call TogglePaste() <CR>
func! TogglePaste()
    exec ":TlistClose"
	if &rnu == 1
        exec ":set invpaste paste"
    else
        exec ":TlistToggle"
        exec ":set invpaste nopaste"
    endif
    exec "se rnu!"
endfun
"nnoremap <F12> :set invpaste paste?<CR>
"imap <F12> <C-O>:set invpaste paste?<CR>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ctags tagList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;/
set autochdir
"更新ctags标签文件快捷键设置
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 1
"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1
"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1
"taglist窗口显示在右侧，缺省为左侧
let Tlist_Use_Right_Window =1
"设置taglist窗口大小
"let Tlist_WinHeight = 100
"let Tlist_WinWidth = 40
"设置taglist打开关闭的快捷键
"noremap <F12> :TlistToggle<CR>

let Tlist_Auto_Update = 1




"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	一键编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F9> :call CompileRun()<CR>
imap <F9> <ESC>:call CompileRun()<CR>
func! CompileRun()
exec "w"
    if expand('%:e') == "c"
        exec "!gcc -std=c++11 % -o %<.zc && ./%<.zc"
    elseif expand('%:e') == "cpp" || expand('%:e') == "cc"
        exec "!g++ -std=c++11 % -o %<.zcpp && ./%<.zcpp"
    elseif expand('%:e') == "java"
        exec "!javac % && java %:r"
    elseif expand('%:e') == "py"
        exec "!py %"
    elseif expand('%:e') == "sh"
        exec "!./%"
    endif
endfun
