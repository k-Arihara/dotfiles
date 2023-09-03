" ----------------------
" 基本的な設定
" ----------------------
"文字コードをUTF-8に設定
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
"indent : 行頭の空白
"eol    : 改行
"start  : 挿入モード開始位置より手前の文字
set backspace=start,indent,eol
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
let g:rehash256 = 1
set background=dark
" タイトルをウィンドウ枠に表示する
set title
" ルーラーを表示
set ruler
" 行番号を表示
set number
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest


" --------------------------
" Tab系
" --------------------------
" タブ入力を複数の空白入力に置き換える
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 前行のインデントを引き継ぐautoindentを有効化
set autoindent


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


" -----------------------
" レジスタ系
" -----------------------
nnoremap x "_x
nnoremap s "_s
nnoremap dd "_dd
nnoremap dD dd
nnoremap c "_c
vnoremap p "_dP

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
" 新規ウィンドウ
noremap <C-n> :<C-u>vsplit<CR>
" ウィンドウ移動
noremap L <C-w>l
noremap H <C-w>h
" ノーマルモードで改行
nnoremap <CR> A<CR><Esc>
" 改行を2回連続で実行したときにautoindentが削除されないようにする
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
" F5で.vimrcを瞬時に開く
nnoremap <F5> :<C-u>.tabedit$MYVIMRC<CR>
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" tmux上ではbackspaceの制御コードが^?となるため
if $TMUX != ""
  inoremap <C-?> <BS>
endif
" 括弧自動補完
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
function! AddIndentWhenEnter()
  if getline(".")[col(".")-1] == "}" && getline(".")[col(".")-2] == "{"
    return "\nX\<C-h>\n\<Up>\<Tab>"
  else
    return "\n"
  endif
endfunction
inoremap <silent> <expr> <CR> AddIndentWhenEnter()

" -----------------------
" その他
" -----------------------
" ターミナル依存
" 必要のない場合は消す
" カーソルの形を変える
if has('vim_starting')
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[1 q"
  " 挿入モードに入るときに非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[5 q"
  " 置換モード時に非点の下線タイプのカーソル
  let &t_SR .= "\e[3 q"
endif
