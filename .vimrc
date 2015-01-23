"###---------------------------
"# setting up Neobundle.
"###---------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" # installed bundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomasr/molokai'
NeoBundle 'rking/ag.vim'

call neobundle#end()


filetype plugin indent on
NeoBundleCheck



"###---------------------------
"# vim settings
"###---------------------------
" # 検索
" ## 大文字小文字を区別しない, 大文字小文字が両方含まれている場合は区別
set ignorecase
set smartcase

" ## 強調表示
set hlsearch

" ## 行番号表示
set number

" ## カーソル位置
set ruler

" ## カーソル行ハイライト
set cursorline

" ## ステータス行
set laststatus=2

" ## 括弧の対応表示
set showmatch
" ## スクロール時の視界
set scrolloff=16

" ## シンタックスハイライト
syntax on

" # tab & indent
" ## tab を space に置換
set expandtab

" ## オートインデント
set autoindent
set smartindent

" ## タブ幅
set tabstop=2
set shiftwidth=2
set softtabstop=2


" ## カラースキーマ
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1

" ## NERDTree setting
nnoremap <C-t> :NERDTreeToggle<Enter> "キーバインド
let NERDTreeShowHidden = 1 "不可視ファイル表示

" ## neocomplcache
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3 " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


filetype on
