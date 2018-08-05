"
" ---------- Setting ----------
"
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

" コマンドラインの補完
set wildmode=list:longest

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
" 検索文字列入力時に順次対象文字にヒット
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ---------- Key binding ----------
nnoremap <ESC><ESC> :nohlsearch<CR>

" ---------- Advanced setting ----------
" 全角スペースの可視化
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
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
Plug 'scrooloose/nerdtree'				" ディレクトリツリーの表示
Plug 'tomtom/tcomment_vim'				" 一括コメントアウト
Plug 'nathanaelkane/vim-indent-guides'	" インデントの深さを可視化
Plug 'bronson/vim-trailing-whitespace'	" 行末の半角スペースを可視化
call plug#end()

" ---------- Plugin setting ----------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237

" ---------- Alias ----------
" NERDTree プラグインのエイリアス
:command Tree NERDTree
