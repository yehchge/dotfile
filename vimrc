
" Bill's _vimrc
" Craeted 2011/03/20 01:26
" Modified 1. 2011/10/29 23:23
" Modified 2. 2011/11/02 22:32

" General Settings
set nocompatible " not compatible with the old-fashion vi mode
set bs=2 " allow backspacing over everything in insert mode
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set autoread " auto read when file is changed from outside

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on " syntax highlight 
set hlsearch " search highlighting

if has("gui_running") " GUI color and font settings
   set guifont=Osaka-Mono:h20
   set background=dark
   "set background=dark
   set t_Co=256 " 256 color mode
   set cursorline " highlight current line
   colors desert 
else 
   " terminal color settings
   colors desert
endif
colorscheme desert "改變vim顏色

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch			" Cursor shows matching ) and }
set showmode			" Show current mode
set wildchar=<TAB>		" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation , or set ai(自動縮排)
set incsearch		" incremental search
set nobackup		" no *~ backup files(設定不產生備份檔案)
"set backup
"set backupdir=~/.bak
"set backupdir=D:\bak
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin "xterm mswin

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

let $LANG="zh_TW.UTF-8"
set termencoding=utf8
set encoding=utf-8
"set gfn=Consolas:h12 " for windows
set gfn=Monospace\ 14 " for Ubuntu
set tabstop=4 "設定tab在vim裡頭佔用的空白格數
"set expandtab "把tab轉為空白,即為按下tab時,實際上是4格空白

set cindent
set nu
set smartindent

set hls
set sw=3

"set background=light
set guioptions-=T "工具列隱藏
set guioptions+=b
set guioptions-=m
"set guioptions-=l
"set guioptions-=r
"set guioptions-=e
set nowrap

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

highlight User1 ctermfg=red guifg=red
highlight User2 term=underline cterm=underline ctermfg=green guifg=green
highlight User3 term=underline cterm=underline ctermfg=yellow guifg=yellow
highlight User4 term=underline cterm=underline ctermfg=white guifg=white
highlight User5 ctermfg=cyan guifg=cyan
highlight User6 ctermfg=white guifg=white
highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse

let php_sql_query=1
let php_htmlInStrings=1

" 顏色設定
colorscheme desert "desert molokai

" colo set
let g:molokai_original = 1

set tags=tags;
set autochdir
set tagrelative

set selectmode=mouse
"set fileencoding=taiwan
nmap l <End>

" 設定摺疊
set foldmarker={{{,}}}
set foldmethod=marker
set foldlevel=2 " 預設全部關閉
let php_folding = 1 " 這個很重要
set foldnestmax=3

":cd C:\data\sites\source
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"noremap <silent> <F11> :cal VimCommanderToggle()<CR>
