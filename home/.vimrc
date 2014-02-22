" Init NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Plugins
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'teoljungberg/vim-grep'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ervandew/supertab'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'kana/vim-fakeclip'

" Appearance
color base16-tomorrow
set background=dark
let &t_Co=256
set guifont=Inconsolata:h18

syntax on
set number
set colorcolumn=80
set hlsearch
set incsearch
set mouse=a

set shiftwidth=2
set softtabstop=2
set nowrap
set expandtab

augroup vimrcEx
  au FileType html,eruby setlocal sw=4 sts=4
augroup END

" General bindings
let mapleader=" "

" Open files in directory of current file
cnoremap %% <c-r>=expand('%:p:h').'/'<cr>
map <leader>e :edit %%

" Grep
noremap <leader>gg :Grep!<space>
let g:grepprg="git grep --no-index -n"

" Fugitive
map <leader>gs :Gstatus<cr>
map <leader>gd :Gdiff<cr>

" Splits
set splitbelow
set splitright
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

filetype plugin indent on
NeoBundleCheck
