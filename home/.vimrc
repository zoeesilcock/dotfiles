set shell=/bin/bash
let os = substitute(system('uname'), "\n", "", "")

" Init NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle#install_process_timeout = 1500

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
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'dag/vim-fish'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'OmniSharp/omnisharp-vim'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.py --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.py --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'powerline'

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

" Omnisharp
set completeopt=longest,menuone,preview

augroup omnisharp_commands
  autocmd!

  " Set autocomplete function to OmniSharp
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  " Automatic syntax check on events
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

  " Show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " The following commands are contextual, based on the current cursor position
  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
  autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  " Finds members in the current buffer
  autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
  " Cursor can be anywhere on the line containing an issue
  autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
  autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
  autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
  autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
augroup END

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" Rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" Syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" File type specific stuff
augroup vimrcEx
  au FileType html,eruby setlocal sw=4 sts=4
augroup END

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

au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.hbs set filetype=mustache
