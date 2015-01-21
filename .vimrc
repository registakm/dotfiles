" Configuration file for vim
set modelines=0		" CVE-2007-2438
syntax on

"モード表示
set showmode
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行のインデントを現在行と同じにする
set autoindent
"編集中のファイル名を表示
set title
"タブは半角4文字分のスペース
set ts=4 sw=4 sts=0


" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=2 " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
