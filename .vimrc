"新しい行のインデントを現在行と同じにする
set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索
"set hlsearch
set incsearch
set ignorecase "大文字・小文字無視
set smartcase "大文字がある場合は上記適用外
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
set ruler "カーソル位置表示
set showtabline=2 "タブ表示
set cursorline "現在行下線表示
set laststatus=2 "ステータス行表示
set wildmenu

"エンコーディング
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932,euc-jp
set fileformats=unix,mac,dos

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"追加モジュール設定
if isdirectory(expand('~/.vim/bundle'))
    filetype plugin indent off
     
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#rc(expand('~/.vim/bundle'))
    endif

    "管理モジュール一覧
    NeoBundle 'git://github.com/Shougo/vimfiler.git'
    NeoBundle 'git://github.com/Shougo/vimshell.git'
    NeoBundle 'git://github.com/Shougo/vimproc.git'
    NeoBundle 'git://github.com/Shougo/unite.vim.git'
    NeoBundle 'git://github.com/Shougo/neocomplcache.git'

    "Filer設定
    let g:vimfiler_as_default_explorer = 1 "標準lsを使用しない
    let g:vimfiler_safe_mode_by_default = 0 "セーフモード無効
    "現在開いているバッファのディレクトリを開く
    nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
    "現在開いているバッファをIDE風に開く
    nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
    "コード補完
    if isdirectory(expand('~/.vim/dictionaries'))
        if filereadable(expand('~/.vim/dictionaries/php.dict'))
            autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
        endif
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_smart_case = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_manual_completion_start_length = 0
        let g:neocomplcache_caching_percent_in_statusline = 1
        let g:neocomplcache_enable_skip_completion = 1
        let g:neocomplcache_skip_input_time = '0.5'
    endif
endif

"シンタックスハイライト有効
syntax on

