let $LANG="zh_TW.UTF-8"
set termencoding=utf8
set encoding=utf-8

set tabstop=4 "設定tab在vim裡頭佔用的空白格數
"set expandtab "把tab轉為空白,即為按下tab時,實際上是4格空白

"set gfn=Courier_New:h10
"複製資料到buffer內,才能用yy,p
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
"behave mswin "xterm mswin
set gfn=Monospace\ 12

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\«cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' » ' . arg3 . eq
endfunction

set cindent
"set nu
set smartindent
"設定不產生備份檔案
set nobackup
"set backup
"set backupdir=~/.bak
"set backupdir=D:\bak
set hls
set nocompatible
set sw=3
set showmatch
"set background=light
"set guioptions-=T
set guioptions+=b
"set guioptions-=l
"set guioptions-=m
"set guioptions-=r
"set guioptions-=e
set nowrap

colorscheme desert "改變vim顏色
syntax on
set ls=2 "laststatus
set statusline=[%n]
set statusline+=%<\  "cut at start
set statusline+=%<%F "顯示檔案名稱
set statusline+=\ [%{(&fenc==\"\")?&enc:&fenc}, " encoding
set statusline+=%{&fileformat} " file format
set statusline+=%{(&bomb?\",BOM\":\"\")}] " detect bomb
set statusline+=%=Lines:%L "顯示行數
set statusline+=\ [%p%%] "顯示游標所在整的檔案的百分比位置
set statusline+=\ \ Ln:%l,\ Col:%c "顯示行列位置
set statusline+=\ %([%1*%M%*%R%Y]%) "設定是否修改、是否唯讀、檔案副檔名

"set statusline=[%n]\ %«%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ ascii['%02b']\ %P

" Tsung's 的狀態列
"set statusline=%«%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
"highlight StatusLine term=bold,reverse cterm=bold,reverse

" Pct 的狀態列
"set statusline=%4*%«\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%m " file format
""set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m " file format & bomb detect
"set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \«\ %2*%P%4*\ \»

" ChenKaie 的狀態列 (Error)
"set statusline=File:\ %t\%r%h%w\ [%{&ff},%{&fileencoding},%Y]\ %m%=
"set statusline+=\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [LINE=%L]

" Chun 的狀態列
"set statusline=File:\ %m%«%f\%r%h%w\ [%{&ff},%{&fileencoding},%Y]%=\ [ASCII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [Total\ Line=%L]

" Linux.com 的狀態列
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Vim Status Bar under OS X
"set statusline=%«%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
 
"Popup Status bar
"set statusline=%«%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P
"set lcs=eol:·,tab:»-,trail:·,extends:»,precedes:«

highlight User1 ctermfg=red guifg=red
highlight User2 term=underline cterm=underline ctermfg=green guifg=green
highlight User3 term=underline cterm=underline ctermfg=yellow guifg=yellow
highlight User4 term=underline cterm=underline ctermfg=white guifg=white
highlight User5 ctermfg=cyan guifg=cyan
highlight User6 ctermfg=white guifg=white

let php_sql_query=1
let php_htmlInStrings=1

"""""""""""
" 顏色設定
"""""""""""
colorscheme desert "desert molokai

"""""""""""
" colo set
"""""""""""
let g:molokai_original = 1

"""""""""""
" tags
"""""""""""
let Tlist_Ctags_Cmd='C:\vim\vim72\ctags.exe'
let g:showfuncctagsbin = 'c:\\vim\\vim72\\ctags.exe'

set tags=tags;
set autochdir
set tagrelative


""""""""""""
" taglist
""""""""""""
let Tlist_Use_Horiz_Window = 0 " 是否使用水平方式顯示
let Tlist_Show_Menu = 1 " 是否加入Menu
let Tlist_Auto_Open = 1 " Function List 是否自動開啟
let Tlist_Auto_Update = 1 " Function 是否自動更新
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File = 1 " 只顯示當前文件
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Process_File_Always = 0
let Tlist_Display_Prototype = 0 " 是否顯示Function參數
let Tlist_Compact_Format = 0
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1 " 設定沒檔案時關閉Vim
let Tlist_Use_SingleClick = 0 " 設定單次點擊
let tlist_php_settings = 'php;c:Classes;i:interFaces;d:const;f:Function List'

" 設定摺疊
set foldmarker={{{,}}}
set foldmethod=marker
set foldlevel=2 " 預設全部關閉
let php_folding = 1 " 這個很重要
set foldnestmax=3

" 設定 WinManager
let g:winManagerWindowLayout = "FileExplorer"

" minibufexpl, Buffer explorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1


":menu File.Save :w^M
":inoremenu File.Save ^O:w^M
":menu Edit.Big\ Changes.Delete\ All\ Space :%s/[ ^I]//g^M
":70menu Buffer.next :bn«CR»
":nmenu Words.Add\ Var wb"zye:men! Word.«C-R»z «C-R»z«CR»
":vmenu Words.Add\ Var "zy:unmenu! Words.«C-R»z «C-R»z«CR»
":imenu Words.Add\ Var «Esc»wb"zye:menu! Word.«C-R»z«C-R»z«CR»a
"amenu Modeline.Insert a VIM modeline «Esc»«Esc»ggOvim:ff=unix ts=4«CR»v
":amenu  icon=foo 1.42 ToolBar.Foo :echo "42!"«CR»
":amenu ToolBar.BuiltIn22 :call SearchNext("back")«CR»
":amenu ToolBar.Hello :echo "hello"«CR»
":amenu ToolBar.Open :e
:amenu FunctionList.ShowToggle :Tlist«CR»


":cd C:\data\sites\source
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"noremap «silent» «F11» :cal VimCommanderToggle()«CR»
