set nocompatible " tab補完         
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
"set wildmenu wildmode=list:full
set wildmenu wildmode=list:longest
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" タブストップ設定
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
" 256色モード
set t_Co=256

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" NeoBundle {{{
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'Yggdroot/indentLine'
" }}}
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
colorscheme desert

syntax enable
filetype plugin indent on

NeoBundleCheck

" indent-guides {{{
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=1
" ガイドの幅
let g:indent_guides_guide_size=1
" 自動カラー無効
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkGrey ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkCyan ctermbg=12
" }}}
