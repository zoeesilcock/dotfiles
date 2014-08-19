" Init NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Plugins
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ervandew/supertab'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'JazzCore/ctrlp-cmatcher'

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

set clipboard=unnamed

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'powerline'

augroup vimrcEx
  au FileType html,eruby setlocal sw=4 sts=4
augroup END

" General bindings
let mapleader=" "
map <leader>k :ccl<cr>
nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>t :tabnew<cr>
nmap <leader>n :noh<cr>
nmap <leader>s :so $MYVIMRC<cr>

" Open files in directory of current file
cnoremap %% <c-r>=expand('%:p:h').'/'<cr>
map <leader>e :edit %%

" The Silver Searcher
noremap <leader>gg :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Fugitive
map <leader>gs :Gstatus<cr>
map <leader>gd :Gdiff<cr>
map <leader>gb :Gblame<cr>

" Ctrl-P
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](test\/dummy|tmp|node_modules|vendor)$' }
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Splits
set splitbelow
set splitright
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd FileType ruby
  \ if expand("%") =~# '_spec\.rb$' |
  \   compiler rspec | setl makeprg=rspec\ $*|
  \ else |
  \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
  \ endif

filetype plugin indent on
NeoBundleCheck
