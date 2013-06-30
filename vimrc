set nocompatible               " Be iMproved

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'tpope/vim-fugitive'

set tags=tags;/
set expandtab
set shiftwidth=2 " tab width
set softtabstop=2
set tabstop=2 " tab wdith expansion
set smarttab
set cindent
set nobackup
set noswapfile
set incsearch
set ignorecase
set smartcase

let mapleader = ","
let g:mapleader = ","

if &diff
else
"    set autochdir " nice for Ex:
endif
set scrolloff=15

colorscheme elflord

filetype indent on
filetype plugin on
syntax on

nmap j gj
nmap k gk

noremap <C-N> :cnext<CR>
noremap <C-P> :cprev<CR>
" I think enter is being interpreted as C-M and randomly killing session
" Don't care about ex mode
noremap Q :qa<CR>

set laststatus=2
set hls

set statusline=%{fugitive#statusline()}\ %F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P 

au BufNewFile,BufRead *.php set makeprg=php\ -l\ %
au BufNewFile,BufRead *.php set errorformat=%m\ in\ %f\ on\ line\ %l

au BufNewFile,BufRead *.md set ft=md

" newlines at end of file getting annoying
set binary
set noeol

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

nnoremap <silent> <Leader>f :<C-u>Unite -start-insert -buffer-name=files file_rec/async file/new<CR>
nnoremap <silent> <Leader>m :<C-u>Unite -start-insert -buffer-name=mru file_mru<CR>
nnoremap <silent> ,h :chdir ~/Git/<CR>
