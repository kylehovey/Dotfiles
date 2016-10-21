" Kyle Hovey's Vim Dotfile

" ================ SYSTEM ================
" Make sure terminal is 256 colors
set t_Co=256

" Set the system clipboard
set clipboard=unnamedplus,unnamed,autoselect

" Enable Mouse Support
set mouse=a

" =========== PLUGIN MANAGER ============= 
" VUNDLE SETUP
" Be iMproved, Required
set nocompatible
" Required
filetype off
" Set the Runtime Path to Include Vundle and Initialize
set rtp+=~/.vim/bundle/Vundle.vim


" VUNDLE PLUGINS

" Begin Plugin Definition
call vundle#begin()

" Vundle Plugin Manager
Plugin 'VundleVim/Vundle.vim'
" Airline Font Support
Plugin 'vim-airline/vim-airline'
" Smooth Solarized Support
Plugin 'altercation/vim-colors-solarized'
" NERD Tree File Browser
Plugin 'scrooloose/nerdtree'
" Syntax Checking
Plugin 'scrooloose/syntastic'
" Better C++ Highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" Better JS Highlighting
Plugin 'pangloss/vim-javascript'

" End Plugin Definition
call vundle#end()
filetype plugin indent on

" =========== SYNTAX HIGHLIGHTING ============= 
" THE BASICS
" Enable It
syntax on

" Dark Background
set background=dark

" Color Scheme
colorscheme solarized

" Syntax Files
" Handlebars Template Syntax
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" ============== FONT SUPPORT =================
" AIRLINE FONT [Airline]
" Allow Airline Fonts
let g:airline_powerline_fonts = 1
" Always Display Status Line
set laststatus=2
" Show the Tab Line When We Need It
set showtabline=1
" Hide the Default Mode Text
set noshowmode

" =============== VIEW SETTINGS =============== 
" THE BASICS
" Enable Line Numbering
set nu
" Wrap text
set lbr	
" Use a Visual Bell
set visualbell

" FOOTER AREA
" Minimize Command Window Height
set cmdheight=1
" Display Cursor Position
set ruler

" =============== EDITOR OPTIONS =============== 
" FOLDING
" Fold Based Upon Indent
set foldmethod=indent
" Deepest Fold Allowed Is 10 Levels
set foldnestmax=10
" Don't Fold by Default
set nofoldenable
" Allow Folding At One Line
set foldlevel=1

" DELETING
" Make Backspace Act Normal
set backspace=2		

" SEARCH HIGHLIGHTING
" Highlight All Search Results
set hlsearch

" SYNTAX CHECKING [Syntastic]
" My Compiler
let g:syntastic_cpp_compiler = 'clang++'
" Use C++ 11
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" =============== EDITOR MACROS =============== 
" SETUP
" SPACE LEADER
let mapleader="\<Space>"
" Use Semicolon for Command Mode
nnoremap ; :

" FILE I/O
" Save
map <Leader>w :w<CR>
" Save As
map <Leader>W :w<Space>	
" Quit
map <Leader>q <C-w>q
" Force Quit
map <Leader>Q <C-w>q!<CR>

" FILE SHORTCUTS
" Edit .vimrc
map <Leader>ev <C-w>v<C-w>l:e ~/.vimrc<CR>
" Edit Todo
map <Leader>eu :e ~/Sync/Todo/todo.vim<CR>
" Edit UPEL Task List
map <Leader>eu :e ~/Sync/Todo/upel.vim<CR>

" TAB MANAGEMENT
" Open a New Tab
map <Leader>t :tabe<CR>

" NERD Tree
map <Leader>f :NERDTreeToggle<CR><C-l>

" COMPILING/RUNNING
" Run In Python 2
map <Leader>p :w !python<CR>
" Run In Python 3
map <Leader>P :w !python3<CR>
" Start Node App
map <Leader>N :!npm start<CR>
" Compile C++
map <Leader>c :!g++ -std=c++11 ./*.cpp -o run<CR>
" Run Compiled C++
map <Leader>R :!./run<CR>
" Generate cout from cmnt
map <Leader>o 0/\/<CR>velcstd::cout << "<esc>$a\n";<esc>
" Turn cout into cmnt
map <Leader>O 0/std<CR>v5ec// <esc>$v3hx

" Searching/Highlighting
" Clear Highlights and Redraw
map <Leader>d :nohl<CR><C-l>

" ============= CRYPTOGRAPHY SETUP ============= 
" Main Crypto
" Use Strong-Ish Algorithm
:setlocal cm=blowfish
