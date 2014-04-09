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

"indent
filetype plugin indent on


"nodebrewはPATHにあるか？
"（※MacVim対策）
if ((stridx($PATH, $HOME . '/.nodebrew') < 0) && isdirectory(expand('~/.nodebrew')))
    let $PATH=$HOME . '/.nodebrew/current/bin:' . $PATH
endif
"
"タブインデントをスペースインデントに変換するコマンド
command ReplaceTabs %s/\t/    /g
command ReplaceSpaceIndents %s/    /\t/g

"追加モジュール設定
if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#rc(expand('~/.vim/bundle'))
    endif

    "管理モジュール一覧
    NeoBundle 'mopp/mopkai.vim'
    NeoBundle 'tpope/vim-repeat'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'Shougo/vimfiler.git'
    NeoBundle 'Shougo/vimshell.git'
    NeoBundle 'Shougo/vimproc.git'
    NeoBundle 'Shougo/unite.vim.git'
    NeoBundle 'Shougo/neocomplcache.git'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'bling/vim-airline'
    NeoBundle 'kchmck/vim-coffee-script.git'
    NeoBundle 'claco/jasmine.vim'
    NeoBundle 'basyura/twibill.vim'
    NeoBundle 'basyura/TweetVim'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'mopp/backscratcher.git'
    NeoBundle 'mopp/tailCleaner.vim'

    "Filer設定
    let g:vimfiler_as_default_explorer = 1 "標準lsを使用しない
    let g:vimfiler_safe_mode_by_default = 0 "セーフモード無効
    "現在開いているバッファのディレクトリを開く
    nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
    "現在開いているバッファをIDE風に開く
    nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
    "コード補完
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 0
    let g:neocomplcache_enable_underbar_completion = 0
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 4
    let g:neocomplcache_min_keyword_length = 4
    let g:neocomplcache_manual_completion_start_length = 0
    let g:neocomplcache_caching_percent_in_statusline = 1
    let g:neocomplcache_enable_skip_completion = 1
    let g:neocomplcache_snippets_disable_runtime_snippets = 1
    "let g:neocomplcache_skip_input_time = '0.5'
    function PHPCompleteSettings()
        set dictionary=~/.vim/dictionaries/php.dict filetype=php
        let g:neocomplcache_plugin_disable = { 'syntax_complete' : 1 }
    endfunction
    if isdirectory(expand('~/.vim/dictionaries'))
        if filereadable(expand('~/.vim/dictionaries/php.dict'))
            autocmd BufRead *.php\|*.ctp\|*.tpl :call PHPCompleteSettings()
        endif
    endif

    "airline
    let g:airline_theme = 'molokai'
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline_linecolumn_prefix = '¶'
    let g:airline_branch_prefix = '⎇ '

    "Tweetvim
    let g:tweetvim_tweet_per_page = 60
    let g:tweetvim_display_source = 1
    let g:tweetvim_display_time = 1
    let g:tweetvim_say_insert_account = 1
    let g:tweetvim_async_post = 1
    let g:tweetvim_open_say_cmd = 'split'
    let g:tweetvim_config_dir = expand('~/.vim/tweetvim')
    let g:tweetvim_display_username = 1
else
    echoerr 'NeoBundle is not installed. Please install it into $HOME/.vim/bundle/neobundle.vim'

endif

"シンタックスハイライト有効
syntax on

"カラースキーム
"MacVimで起動時に反転してしまう事象対策で関数化し
"autocmdを使ってGUI起動時に色設定を行う
"Reference: http://d.hatena.ne.jp/yayugu/20110918/1316363220
function SetColorScheme()
    set background=dark
    colorscheme mopkai
endfunction
augroup guicolorscheme
    autocmd!
    execute 'autocmd GUIEnter * call SetColorScheme()'
augroup END
call SetColorScheme()

"文法チェック (PHP)
function MakePHP()
    set makeprg=php\ -l\ %
    set errorformat=%m\ in \ %f\ on\ line\ %l
    make
endfunction
command PHPSyntaxCheck call MakePHP()

let php_folding = 1

" CoffeeScriptのコンパイラとタブの特例
function CoffeeScriptEditInit()
    compiler coffee
    "setlocal noet
endfunction
augroup filetypedetect
    au BufRead,BufNewFile *.coffee call CoffeeScriptEditInit()
augroup END

" PHPStylist
" Reference: http://blog.starbug1.com/archives/821
if isdirectory(expand('~/.vim/phpStylist'))
    function! s:PhpStylist()
        execute "w"
        normal ggdG
        execute "0r!~/.vim/phpStylist/phpStylist %"
        normal Gdd
    endfunction
    command! PhpStylist call <SID>PhpStylist()
endif

" commentout.vim http://nanasi.jp/articles/vim/commentout_source.html
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>



