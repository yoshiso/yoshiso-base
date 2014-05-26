"##### 編集関係 ######
" Swapファイル？Backupファイル？前時代的すぎ
" " なので全て無効化する
set nowritebackup
set nobackup
set noswapfile
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#####表示設定#####
set encoding=utf-8
set number  "行番号を表示する
set title   "編集中のファイル名を表示
set list    " 不可視文字の可視化
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=2 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set laststatus=2 "ステータスラインを常に表示
" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set expandtab "タブの代わりに空白文字挿入
set ts=2  sw=2 sts=0 "タブは半角4文字分のスペース


"#### キーバインディング #####

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk


"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidhalter/jedi-vim'

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif


"###### NERDTree ######
""引数なしでvimを開いたらNERDTreeを起動、
autocmd vimenter * if !argc() | NERDTree | endif

"NERDTreeIgnore 無視するファイルを設定する。
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$','\.pyc$']

"NERDTreeShowHidden 隠しファイルを表示するか？
"0 : 隠しファイルを表示しない。
"1 : 隠しファイルを表示する。
let g:NERDTreeShowHidden=1

"NERDTreeを+|`などを使ってツリー表示をする。
let g:NERDTreeDirArrows=0

"マウス操作方法
"1 : ファイル、ディレクトリ両方共ダブルクリックで開く。
"2 : ディレクトリのみシングルクリックで開く。
"3 : ファイル、ディレクトリ両方共シングルクリックで開く。
:set mouse=a
let g:NERDTreeMouseMode=3


syntax on "コードの色分け
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256