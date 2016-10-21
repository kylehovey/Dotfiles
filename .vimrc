" Kyle Hovey's Vim Dotfile

" ================ SYSTEM ================
" THE BASICS
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
" Surround
Plugin 'tpope/vim-surround'
" Git Integration
Plugin 'tpope/vim-fugitive'
" Auto Complete
Plugin 'Valloric/YouCompleteMe'
" Better C++ Highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" Better JS Highlighting
Plugin 'pangloss/vim-javascript'
" Git Diff
Plugin 'airblade/vim-gitgutter'

" End Plugin Definition
call vundle#end()
filetype plugin indent on

" =========== SYNTAX HIGHLIGHTING ============= 
" THE BASICS
" Enable It
syntax on

" DARK BACKGROUND
set background=dark

" COLOR SCHEME
colorscheme solarized

" SYNTAX FILES
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

" TABBING
" Sane tabstop
set tabstop=4
set shiftwidth=4

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

" GIT [GitGutter]
" Disabled by Default
let g:gitgutter_enabled = 0

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
map <Leader>q :q<CR>
" Force Quit
map <Leader>Q :q!<CR>

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

" NERD TREE
" Show/Hide NERD Tree
map <Leader>f :NERDTreeToggle<CR><C-l>

" GIT
" Show/Hide GitGutter
map <Leader>gg :GitGutterToggle<CR>:GitGutterLineHighlightsToggle<CR>
" Stage Current File
map <Leader>ga :Gwrite<CR>
" Commit Changes
map <Leader>gc :Gcommit -v<CR>
" Push Changes
map <Leader>gp :!git push origin master<CR>

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
map <Leader>o 0/\/<CR>velcstd::cout << "<esc>$a\n";<esc>:nohl<CR><C-l>
" Turn cout into cmnt
map <Leader>O 0/std<CR>v5ec// <esc>$v3hx:nohl<CR><C-l>

" SEARCHING/HIGHLIGHTING
" Clear Highlights and Redraw
map <Leader>d :nohl<CR><C-l>

" ============= CRYPTOGRAPHY SETUP ============= 
" MAIN CRYPTO
" Use Strong-Ish Algorithm
:setlocal cm=blowfish
