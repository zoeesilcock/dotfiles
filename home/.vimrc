" Init NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Plugins
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'chriskempson/base16-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'teoljungberg/vim-grep'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'groenewege/vim-less'

" Appearance
color base16-tomorrow
set background=dark
let &t_Co=256
set guifont=Inconsolata:h18

syntax on
set number
set colorcolumn=80
set nowrap
set hlsearch
set mouse=a

augroup vimrcEx
  au FileType html,eruby setlocal sw=4 sts=4
augroup END

" Bindings
let mapleader=" "
noremap <leader>gg :Grep!<space>
noremap <leader>ct :!ctags -R -f ./.git/tags .<return>

filetype plugin indent on
NeoBundleCheck