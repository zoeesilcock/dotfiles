set shell=/bin/bash
let os = substitute(system('uname'), "\n", "", "")

call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'Chiel92/vim-autoformat'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'skwp/greplace.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.py --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
Plug 'junegunn/goyo.vim'

call plug#end()

" Appearance
color base16-tomorrow
set background=dark
let &t_Co=256
set guifont=Inconsolata:h18

if os == 'Darwin' || os == 'Mac'
  let base16colorspace=16
else
  let base16colorspace=256
endif

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

set diffopt=vertical

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'

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
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](test\/dummy|tmp|node_modules|vendor|public|bower_components)$' }
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

" Splits
set splitbelow
set splitright
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Tabs
noremap <leader>h gT
noremap <leader>l gt
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Vinegar
map <c-_> :Tex<cr>
noremap _ :Vex<cr>

" Syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" greplace.vim
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

" Make readable JSON
:command PrettyJson %!python -m json.tool

" Goyo
function! s:goyo_enter()
  set wrap
  set linebreak
  setlocal spell spelllang=en_us
  silent !tmux set status off
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  setlocal nospell
  silent !tmux set status on
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

xnoremap p "_dP
