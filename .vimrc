"ファイルエンコード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set ignorecase "検索のときに大文字小文字を区別しない
set smartcase "検索のときに大文字が含まれている場合は区別して検索する
set wrapscan "最後まで検索したら先頭に戻る
set title "タイトルを表示
set backspace=indent,eol,start
set tw=0

"Color Preference
syntax on "カラー設定を有効に
set background=dark
colorscheme molokai
" molokaiをちょっとだけ改造
" http://shocrunch.hatenablog.com/entry/2015/01/15/234555
hi Comment ctermfg=102
hi Visual  ctermbg=236

"" 基本設定
set wildmenu "コマンドラインを拡張モードに
set expandtab
set softtabstop=4
set shiftwidth=4
set noexpandtab
set noautoindent
set number
set showmatch
set wildmenu
set nowrap
set nocompatible
filetype on

"クリップボードの共有
set clipboard+=autoselect
set clipboard+=unnamed

"カーソル行をハイライト
set cursorline
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"検索結果をハイライト
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"Neobundle関連の設定
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif


call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
			\ 'build': {
			\ 'windows': 'make -f make_mingw32.mak',
			\ 'cygwin': 'make -f make_cygwin.mak',
			\ 'mac': 'make -f make_mac.mak',
			\ 'unix': 'make -f make_unix.mak',
			\ }
\}

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'

NeoBundle 'dbext.vim'
NeoBundle 'AutoClose'

NeoBundle 'Shougo/unite.vim'

"補完＆スニペット"
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

"PEP-8(Python Coding Rules)"
NeoBundle 'scrooloose/syntastic'

NeoBundle 'stephpy/vim-yaml'

" Jedi Vim
""NeoBundleLazy "davidhalter/jedi-vim", {
""      \ "autoload": {
""      \   "filetypes": ["python", "python3", "djangohtml"],
""      \ },
""      \ "build": {
""      \   "mac": "pip install jedi",
""      \   "unix": "pip install jedi",
""      \ }}
""let s:hooks = neobundle#get_hooks("jedi-vim")
""function! s:hooks.on_source(bundle)
""  " jediにvimの設定を任せると'completeopt+=preview'するので
""  " 自動設定機能をOFFにし手動で設定を行う
""  let g:jedi#auto_vim_configuration = 0
""  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
""  let g:jedi#popup_select_first = 0
""  " quickrunと被るため大文字に変更
""  let g:jedi#rename_command = '<Leader>R'
""  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
""  let g:jedi#goto_command = '<Leader>G'
"" endfunction


"Installしたいファイルリストを書く
"
"

filetype plugin on
filetype indent on


" "NeoSnippet"
" "Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)
 
 " SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 			\ "\<Plug>(neosnippet_expand_or_jump)"
 			\: pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 			\ "\<Plug>(neosnippet_expand_or_jump)"
 			\: "\<TAB>"
 
 " For snippet_complete marker.
 if has('conceal')
 	set conceallevel=2 concealcursor=i
 endif"

"Latex プラグインの設定
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = 'platex -synctex=1 -src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -t a4 -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_dvi = 'open -a PictPrinter.app'
let g:Tex_ViewRule_ps = 'gv --watch'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'

""テンプレートの読み込み
autocmd BufNewFile *.py 0r ~/.vim/templates/python.py
autocmd BufNewFile *.md 0r ~/.vim/templates/markdown.md


" quick run"
"" testからはじまるpythonファイルをテストコードとする 
autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test

" quickrun.vim 用設定 
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c -v %s']}

call neobundle#end()
