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
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'altercation/vim-colors-solarized'

set tags=tags;/
set shiftwidth=2 " tab width
set softtabstop=2
set tabstop=2 " tab wdith expansion
set cindent
set nobackup
set noswapfile
set incsearch
set ignorecase
set smartcase
set expandtab

let mapleader = ","
let g:mapleader = ","

if &diff
    set wrap
else
"    set autochdir " nice for Ex:
endif
set scrolloff=15

syntax enable
set background=dark
colorscheme solarized

filetype indent on
filetype plugin on

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
au BufNewFile,BufRead *.class set ft=php

" newlines at end of file getting annoying
set binary
set noeol

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

nnoremap <silent> <Leader>f :<C-u>Unite -start-insert -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> <Leader>wf :<C-u>Unite -start-insert -buffer-name=files -input=<C-R>=expand("<cword>")<CR> file_rec/async:!<CR>
nnoremap <silent> <Leader>F :<C-u>Unite -start-insert -buffer-name=files file_rec/async:~/Git/<CR>
nnoremap <silent> <Leader>m :<C-u>Unite -start-insert -buffer-name=mru file_mru<CR>
nnoremap <silent> <Leader>wg :<C-u>Unite -buffer-name=files grep:.:-iRI:<C-R>=expand("<cword>")<CR> <CR>
nnoremap <silent> <Leader>wG :<C-u>Unite -buffer-name=files grep:~/Git/:-iRI:<C-R>=expand("<cword>")<CR> <CR>
nnoremap <silent> ,h :chdir ~/Git/<CR>

set expandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let g:rbpt_colorpairs = [
            \ ['blue',       '#FF6000'],
            \ ['cyan', '#00FFFF'],
            \ ['darkmagenta',    '#CC00FF'],
            \ ['yellow',   '#FFFF00'],
            \ ['red',     '#FF0000'],
            \ ['darkgreen',    '#00FF00'],
            \ ['White',         '#c0c0c0'],
            \ ['blue',       '#FF6000'],
            \ ['cyan', '#00FFFF'],
            \ ['darkmagenta',    '#CC00FF'],
            \ ['yellow',   '#FFFF00'],
            \ ['red',     '#FF0000'],
            \ ['darkgreen',    '#00FF00'],
            \ ['White',         '#c0c0c0'],
            \ ['blue',       '#FF6000'],
            \ ['cyan', '#00FFFF'],
            \ ['darkmagenta',    '#CC00FF'],
            \ ['yellow',   '#FFFF00'],
            \ ['red',     '#FF0000'],
            \ ['darkgreen',    '#00FF00'],
            \ ['White',         '#c0c0c0'],
            \ ]

" Update this with the amount of supported colors
"let g:rbpt_max = 21
let g:rbpt_max = 21


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
