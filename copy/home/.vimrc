""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up vim-plug and install plugins.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" vim-airline provides a status bar at the bottom of a window which is a good
" place to put all kinds of metadata.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-monokai provides a Monokai colour scheme based on the original Textmate
" scheme.
Plug 'crusoexia/vim-monokai'

" vim-polyglot is a language pack that loads syntax definitions on-demand. It
" includes definitions for modern JavaScript, including JSX.
Plug 'sheerun/vim-polyglot'

" nerdtree provides a file system explorer.
Plug 'scrooloose/nerdtree'

" vim-fugitive is a wrapper for Git that allows various operations from within
" vim.
Plug 'tpope/vim-fugitive'

" ctrlp is a fuzzy file search tool. Pressing Ctrl+P activates it and allows
" us to search all files within a directory.
Plug 'ctrlpvim/ctrlp.vim'

" vim-commentary is a tool to make it easy to comment and uncomment multiple
" lines in a file.
Plug 'tpope/vim-commentary'

" vim-gitgutter displays icons in the gutter to indicate lines that have
" changed compared to the index in a file within a git repository.
Plug 'airblade/vim-gitgutter'

" ale is the 'asynchronous linting engine' for linting code in various
" languages.
Plug 'dense-analysis/ale'

" editorconfig-vim is a plugin to get vim to automatically apply the
" Editorconfig standard defined for a directory tree.
Plug 'editorconfig/editorconfig-vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't unload buffers when opening new ones. This makes it possible to switch
" buffers without having to save changes in the existing one.
set hidden

" Automatically read files when they change outside of Vim.
set autoread

" Allow backspacing over auto-indents, end of line characters, and text that
" was inserted prior to the current start of insert mode. This is much more
" intuitive than the default which prevents backspacing over the above.
set backspace=indent,eol,start

" Start scrolling when the cursor is 8 lines off the top or bottom of the
" buffer. This is a bit nicer than the default which is to scroll when the
" cursor reaches the first or last line only.
set scrolloff=8

" Use 2 spaces instead of real tab characters.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Enable system clipboard integration on MacOS.
set clipboard=unnamed

" Set the default encoding to UTF-8.
set encoding=utf-8

" Turn off error sounds.
set noerrorbells
set novisualbell

" Persist undo across sessions if possible.
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
endif

" Smart case-insensitive, find-as-you-type search. Switches into
" case-sensitive mode if the search string contains an uppercase character.
set ignorecase
set smartcase
set incsearch

" Display enhanced autocomplete menus.
set wildmenu

" Ignore some common directories. These ignore paths are used by various
" commands and plugins, including ctrlp.
set wildignore+=*/node_modules/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show line numbers.
set number

" Enable syntax highlighting and use the Monokai colour scheme.
syntax enable
colorscheme monokai

" Display a background highlight on the current line.
set cursorline

" Only show the backgroud highlight on the current line in the active buffer.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Highlight all search matches.
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure vim-airline to display a tab line at the top of the window, enable
" powerline fonts which are necessary for rendering various symbols on the
" status bar and set the theme.
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'

" Configure Nerdtree to show hidden files except for Vim swap files.
let g:NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$']

" Configure ctrlp to show hidden files and to use ag for search if it's
" available on the system.
let g:ctrlp_show_hidden=1
if executable('ag')
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings.
"
" The <C-u> part of many of these mappings is there to remove any characters
" between the start of the command mode line (the colon) and the cursor.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the leader to the comma key. This means we lose the default
" functionality which is to repeat the last FfTt motion in the opposite
" direction. That's not something I often need so this is an acceptable
" trade-off. The local leader is set to the backslash (which has to be
" escaped) which is unbound by default.
let mapleader=','
let maplocalleader='\\'

" Map semicolon to colon to avoid the need to hold shift when you want to
" run a command.
nnoremap ; :

" Configure the pointless key to the left of the number line on MacBook Pro
" keyboards to open Nerdtree.
nnoremap § :<C-u>NERDTreeToggle<CR>

" Map return to clear any active search. This is useful in combination with
" highlights on all search matches which are annoying once you've found what
" you were looking for.
nnoremap <CR> :noh<CR>

" Mappings for vim-fugitive to allow easier access to git from within the
" editor. There are plenty more that we could add here but I tend not to use
" git to the max within the editor.
nnoremap <leader>gs :<C-u>Gstatus<CR>
nnoremap <leader>gb :<C-u>Gblame<CR>
nnoremap <leader>gd :<C-u>Gdiff<CR>
