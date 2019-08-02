set nocompatible " tab補完
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
"set wildmenu wildmode=list:full
set wildmenu wildmode=list:longest
" スワップファイルは使わない
set noswapfile
" チルダファイルは使わない
set nobackup
" un files も不要　
set noundofile
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

" 検索設定
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

set nu
set history=50

set modelines=0
set nomodeline

command W w
command Q q

syntax on
syntax enable
filetype plugin indent on

" indent-guides {{{
"let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=1
" ガイドの幅
"let g:indent_guides_guide_size=2
" 自動カラー無効
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkGrey ctermbg=darkgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkCyan ctermbg=12
" }}}

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
"
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
      autocmd!
      autocmd InsertEnter * call s:StatusLine('Enter')
      autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""
