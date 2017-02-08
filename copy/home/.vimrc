set shell=/bin/bash " Currently required for vim-gitgutter to work

"
" Vundle
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"
" Plugins
"
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/html5.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'digitaltoad/vim-pug'
Plugin 'w0rp/ale'
Plugin 'ekalinin/Dockerfile.vim'

call vundle#end()

"
" General
"
if has('autocmd')
  filetype plugin indent on " Automatically detect filetypes
endif

set autochdir " Automatically use the current file's directory as the cwd
set autoread " Automatically read files when they change outside of Vim
set backspace=indent,eol,start " Intuitive backspace
set nrformats-=octal " Don't treat 0-prefixed numbers as octal
set encoding=utf-8 " Set the default encoding

" Turn off error sounds
set noerrorbells
set novisualbell

" Allow mouse use if possible
if has('mouse')
  set mouse=a
endif

" Persist undo across sessions if possible
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
endif

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe 'normal! g`"' |
  \ endif

" Enable system clipboard integration on OS X
set clipboard=unnamed

"
" Color scheme and appearance
"
set t_Co=256

if has('syntax') && !exists('g:syntax_on')
  syntax enable " Turn on syntax highlighting
endif

colorscheme monokai

" Turn off text background colour
hi Normal ctermbg=NONE

set number " Always show line numbers
set showmode " Always display the current mode
set cursorline " Background highlight on current line
set laststatus=2 " Always show the status line
set ruler " Show the line/column number of the cursor in the status line

"Only show the backgroud highlight in the active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"
" Search/Subtitution
"
set showmatch " Show matching brackets
set incsearch " Find-as-you-type search
set hlsearch " Highlight matches
set ignorecase " Case-insensitive search
set smartcase " But case-sensitive if expression contains a capital letter

"
" Indentation
"
set smartindent " Smart auto-indenting when starting a new line
set autoindent " Indent at same level as previous line
set tabstop=2 " Tabs are 2 columns wide
set shiftwidth=2 " Reindent operators move by 2 columns
set softtabstop=2 " Use 2 columns when Tab is pressed in insert mode
set expandtab " Spaces instead of actual tabs

"
" Scrolling
"
set scrolloff=8 " Start scrolling when 8 lines off the top/bottom
set sidescrolloff=15 " Start scrolling when 15 lines off the left/right
set sidescroll=1 " Minimal number of columns to scroll horizontally

"
" Key mappings
"
let mapleader = ','
let maplocalleader = '\\'

nnoremap ; :

" Viewport navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Viewport relocation
nnoremap <leader>h <C-w>H
nnoremap <leader>j <C-w>J
nnoremap <leader>k <C-w>K
nnoremap <leader>l <C-w>L

" Map Ctrl+C to escape
inoremap <C-c> <esc>

" Return clears search
nnoremap <CR> :noh<CR>

" Open .vimrc in vertical split
nnoremap <leader>ev :vs $MYVIMRC<CR>

"
" Plugin configuration
"

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" Completion settings
set completeopt-=preview
set complete-=i

" Fugitive mappings
nnoremap <leader>gs :<C-u>Gstatus<CR>
nnoremap <leader>gw :<C-u>Gwrite<CR>
nnoremap <leader>gc :<C-u>Gcommit<CR>
nnoremap <leader>gb :<C-u>Gblame<CR>
nnoremap <leader>gd :<C-u>Gdiff<CR>
nnoremap <leader>gj :<C-u>Gpull<CR>
nnoremap <leader>gk :<C-u>Gpush<CR>
nnoremap <leader>gf :<C-u>Gfetch<CR>

" NERDTree mappings
nnoremap § :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.swp$']

" JSX settings
let g:jsx_ext_required = 0

" CtrlP settings
set wildmenu
set wildignore+=*/.git/*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=*bower_components*

let g:ctrlp_cmd='CtrlP'
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_map='<c-p>'

if executable('ag')
  " Use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag with CtrlP
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif
