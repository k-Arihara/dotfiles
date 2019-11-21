"-------------------
" dein.vim設定
" ------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
	" 予め TOML ファイル（後述）を用意しておく
	let g:rc_dir    = expand('~/.vim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
	call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif
" ------------------
" dein.vim設定終了
" ------------------


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
" colorschemeを変更
colorscheme molokai
let g:rehash256 = 1
set background=dark
" タイトルをウィンドウ枠に表示する
set title
" ルーラーを表示
set ruler
" 行番号を表示
set number
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
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
" 新規ウィンドウ
noremap <C-n> :<C-u>vsplit<CR>
" ウィンドウ移動
noremap L <C-w>l
noremap H <C-w>h
" ノーマルモードで改行
nnoremap <CR> A<CR><Esc>
" deleteキー有効化
inoremap <C-?> <Right><C-h>
nnoremap <F5> :<C-u>.tabedit$MYVIMRC<CR>
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <C-u> <Left><Del>

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
" コマンドモードでエイリアスを有効化
let $BASH_ENV = "~/.bash/.bash_aliases"


"-------------------------------
" neocomplete, neosnippetの設定
"-------------------------------
" vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 1文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 1
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" TABで補完を決定
inoremap <expr><TAB> pumvisible() ? "\<SPACE>\<C-h>" : "\<TAB_>"
"--------------------------------
"neocomplete, neosnippet設定終了
"--------------------------------


"-------------------------------
"syntastic の設定
"-------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"-------------------------------
"syntastic の設定終了
"-------------------------------

