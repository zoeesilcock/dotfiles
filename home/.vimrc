set shell=/bin/bash
let os = substitute(system('uname'), "\n", "", "")

call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'skwp/greplace.vim'

call plug#end()

" Appearance
try
    let base16colorspace=256
    colorscheme base16-tomorrow
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

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
xnoremap p "_dP

" Open files in directory of current file
cnoremap %% <c-r>=expand('%:p:h').'/'<cr>
map <leader>e :edit %%

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

" Syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" greplace.vim
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

" Make readable JSON
:command PrettyJson %!python -m json.tool
