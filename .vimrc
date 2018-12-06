"
" ~/.vimrc
"

" ---------- Setting ----------
" 文字コードを UTF-8 に設定
set fenc=utf-8

" ウィンドウのタイトルバーにファイルのパス情報を表示
set title

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" 入力中のコマンドをステータスに表示
set showcmd

" スワップファイルの無効化
set noswapfile

" 全角記号の文字幅を正しく設定
set ambiwidth=double

" エラー時にビープ音を鳴らさない
set noerrorbells

" 折り返し時に表示行単位での移動を可能
nnoremap j gj
nnoremap k gk

" コマンドラインの補完
set wildmode=list:longest

" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

" ---------- Visual ----------
" 行番号を表示
set number

" 現在用を強調
set cursorline

" インデントをスマートインデントに設定
set smartindent

" 括弧入力時に対応する括弧を表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" カーソル位置の表示
set ruler

" 暗い背景色に合わせた配色にする
set background=dark

" 構文毎に文字色を変化
syntax on

" カラースキーマ設定
colorscheme default

" 行番号の色
highlight LineNr ctermfg=39
highlight LineNr ctermbg=234

" ---------- Tab ----------
" 行頭以外の Tab 文字の表示幅を 4 に設定
set tabstop=4

" 行頭での Tab 文字の表示幅を 4 に設定
set shiftwidth=4

" ---------- Search ----------
" 検索文字列が小文字の場合は大文字小文字を区別しない
set ignorecase

" 検索文字列に大文字が含まれている場合は大文字小文字を区別する
set smartcase

" 検索文字列入力時に順次対象文字にヒット
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ---------- Key binding ----------
" ESC (Ctrl + [) キーを 2 回で検索ハイライトを削除
nnoremap <ESC><ESC> :nohlsearch<CR>

" ウィンドウ間の移動方法
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ---------- Advanced setting ----------
" 全角スペースの可視化
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=red guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif

" 挿入モード時，ステータスラインの色を変更
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

" 前回のカーソル位置を復元
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\	exe "normal! g'\"" |
				\ endif
endif

" ---------- Plugin install ----------
call plug#begin('~/.vim/plugged')

" ディレクトリツリーの表示
Plug 'scrooloose/nerdtree'

" 一括コメントアウト
Plug 'tomtom/tcomment_vim'

" インデントの深さを可視化
Plug 'nathanaelkane/vim-indent-guides'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" Python
" Python の補完
Plug 'davidhalter/jedi-vim'

call plug#end()

" ---------- Plugin setting ----------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237
function s:MoveToFileAtStart()
  call feedkeys("\")
  call feedkeys("\l")
endfunction
autocmd VimEnter *  NERDTree | call s:MoveToFileAtStart()
" 終了時，NERDTree も終了
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---------- Filetype setting ----------
" .py は Python ファイルとして認識
autocmd BufRead,BufNewFile *.py set filetype=python
" docstring のポップアップを無効化
autocmd FileType python setlocal completeopt-=preview
" .rst のタブ文字数設定
autocmd BufRead,BufNewFile *.rst setlocal tabstop=3 shiftwidth=3
" .md は Markdown ファイルとして認識
autocmd BufRead,BufNewFile *.md set filetype=markdown

" ---------- Commands ----------
" NERDTree 開閉のコマンド
:command Topen NERDTree
:command Tclose NERDTreeClose

" 最後に保存したファイルと diff する
:command Diff vert new | set buftype=nofile | read ++edit # | 0delete_ | diffthis | wincmd p | diffthis
