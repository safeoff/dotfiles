set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'dense-analysis/ale'
Plugin 'aklt/plantuml-syntax'
Plugin 'vim-scripts/taglist.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'will133/vim-dirdiff'
Plugin 'tpope/vim-dispatch'
Plugin 'thinca/vim-quickrun'
Plugin 'janko/vim-test'
Plugin 'Shougo/vimproc.vim'

call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く

" syntax
syntax on
"set smartindent

" not 8進数
set nf=""

" line number
set number

" encode
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932,utf-16le
set fileformats=unix,dos,mac

" tab
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmenu
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" backup
set nobackup
set noswapfile

" buffer
set hidden
set confirm

" input
set backspace=2

" search
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch

" {}
set showmatch
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>

" date
inoremap <expr> ,df strftime('%Y-%m-%d')

" paste
set clipboard=unnamedplus
vmap <C-c> :w !xsel -ib<CR><CR>
let &t_ti .= "\e[?2004h"
let &t_te .= "\e[?2004l"
let &pastetoggle = "\e[201~"
function XTermPasteBegin(ret)
    set paste
    return a:ret
endfunction
noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
cnoremap <special> <Esc>[200~ <nop>
cnoremap <special> <Esc>[201~ <nop>

" grep
autocmd QuickFixCmdPost *grep* cwindow
"set grepprg=rg
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
"set grepprg=pt
"autocmd! QuickFixCmdPost * call s:SortQuickfix('s:QfStrCmp')
"function! s:SortQuickfix(fn)
"    call setqflist(sort(getqflist(), a:fn))
"endfunction
"function! s:QfStrCmp(e1, e2)
"    let [t1, t2] = [bufname(a:e1.bufnr), bufname(a:e2.bufnr)]
"    return t1 <? t2 ? -1 : t1 ==? t2 ? 0 : 1
"endfunction

" taglist
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_one_File = 1
let g:tlist__ERB_settings = 'ERB;f:function'
set iskeyword=@,48-57,_,-,:,192-255

" quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
\    "runner": "vimproc",
\    "runner/vimproc/updatetime": 40,
\    "outputter": "error",
\    "outputter/error/success": "buffer",
\    "outputter/error": "quickfix",
\    "outputter/quickfix/into": 1,
\    "outputter/buffer/split": ":botright 8sp",
\    "hook/time/enable": 1,
\    "outputter/buffer/close_on_empty": 1,
\}
nnoremap \q :<C-u>bw! \[quickrun\ output\]<CR>
au FileType qf nnoremap <silent><buffer>q :quit<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" color
set t_Co=256
autocmd Colorscheme * hi Comment ctermfg=136
colorscheme ron

" netrw
let g:netrw_keepdir = 0

" ;:
nnoremap ; :
nnoremap : ;

" asm
let asmsyntax = "nasm"

" align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let test#strategy = "dispatch"

set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
