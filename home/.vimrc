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
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'

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

" Bindings
let mapleader=" "
noremap <leader>gg :Grep!<space>
noremap <leader>ct :!ctags -R -f ./.git/tags .<return>

filetype plugin indent on
NeoBundleCheck
