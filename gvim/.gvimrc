" ----------------------
" 基本的な設定
" ----------------------
"文字コードをUFT-8に設定
set fenc=utf-8
" エンコード設定
set encoding=utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" ビープ音を鳴らさない
set vb t_vb=
" 入力中のコマンドをステータスに表示する
set showcmd
"backspace有効化
set backspace=indent,eol,start
" 改行コードを自動認識
set fileformats=unix,dos,mac
" クリップボード使用可
set clipboard=unnamed,autoselect

" ---------------------
" バックアップ関係
" ---------------------
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

" ---------------------
" 見た目系
"----------------------
" シンタックスハイライトを有効化
syntax on
" タイトルをウィンドウ枠に表示する
set title
" ルーラーを表示
set ruler
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest


" --------------------------
" Tab系
" --------------------------
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" -------------------------
" 検索系
" -------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ------------------------
" キーマッピング
" ------------------------
" ESC置換
inoremap jj <Esc>
inoremap っｊ <Esc>
" 挿入モード時の右移動簡易化
inoremap <C-l> <Right>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" -----------------------
" その他
" -----------------------
"
" 必要のない場合は消す
" カーソルの形を変える
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
