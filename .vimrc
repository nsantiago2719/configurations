syntax on
filetype plugin indent on


" Snips path
"set runtimepath+=~/.vim/
let g:UltiSnipsSnippetsDir="~/.vim/bangbang"
let g:UltiSnipsSnippetDirectories=["bangbang"]

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Bundle "lepture/vim-jinja"
Plugin 'darthmall/vim-vue'

call vundle#end()
filetype plugin indent on


" CtrlP
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Encoding
set encoding=utf-8
" Mouse usage
set mouse=a

" Disable Backup

set nobackup
set noswapfile
set nowb

" Theme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" Disable visual and sound bell
set novisualbell
set noerrorbells

set nocompatible
let mapleader=","
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set backspace=indent,eol,start
set incsearch
set hlsearch
set scrolloff=3
set laststatus=2
set title
set nowrap
set history=1000
set undolevels=500
set ruler
" set cursorline
set synmaxcol=512
set list

" UltiSnip Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<s-tab>"
autocmd BufRead,BufNewFile *.vue setfiletype javascript

" Tab Mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmov
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Map windows
map <leader>mv :vsplit <cr>
map <leader>ms :split <cr>
map <leader>wh <C-W>h <cr>
map <leader>wj <C-W>j <cr>
map <leader>wk <C-W>k <cr>
map <leader>wl <C-W>l <cr>

" Window resize
map + <c-w>+
map _ <c-w>-

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

nmap <F4> :NERDTreeToggle<cr>

map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\
au InsertEnter * :set listchars-=trail:•
au InsertLeave * :set listchars+=trail:•

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('File Name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>j :call RenameFile()<cr>

