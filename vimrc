set nocompatible
set tags=tags;/
set expandtab
set shiftwidth=4 " tab width
set softtabstop=4
set tabstop=4 " tab wdith expansion
set smarttab
set autoindent
set cindent
set smartindent
set nobackup
set noswapfile
set incsearch
set ignorecase
set smartcase

if &diff
else
    set autochdir " nice for Ex:
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
noremap QQ :qa<CR>

set laststatus=2
set hls
"set diffopt+=iwhite
"set list

let MRU_Exclude_Files = '^/tmp/.*'
let MRU_Max_Entries = 3000

set statusline=%{fugitive#statusline()}\ %F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P 
