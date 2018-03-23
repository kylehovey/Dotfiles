" Kyle Hovey's Vim Dotfile
" Disable weird spacing with emoji's
:set noemoji

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
" NERD Tree File Browser
Plugin 'scrooloose/nerdtree'
" Syntax Checking
Plugin 'scrooloose/syntastic'
" Surround
Plugin 'tpope/vim-surround'
" Repeat with .
Plugin 'tpope/vim-repeat'
" Git Integration
Plugin 'tpope/vim-fugitive'
" Auto Complete
Plugin 'Valloric/YouCompleteMe'
" Language Support
Plugin 'sheerun/vim-polyglot'
" Better JS Support
Plugin 'pangloss/vim-javascript'
" Git Diff
Plugin 'airblade/vim-gitgutter'
" Smooth Scrolling
Plugin 'yuttie/comfortable-motion.vim'
" Vim LaTeX
Plugin 'vim-latex/vim-latex'
" Latex Preview
Plugin 'xuhdev/vim-latex-live-preview'
" Markdown Preview
Plugin 'JamshedVesuna/vim-markdown-preview'
" Indentation Highlighting
Plugin 'Yggdroot/indentLine'
" Color Highlighting
Plugin 'lilydjwg/colorizer'
" Dev Icons for Vim
" Plugin 'ryanoasis/vim-devicons'
" NerdTree Syntax Highlighting
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Vim PanDoc
Plugin 'vim-pandoc/vim-pandoc'
" Vim PanDoc Syntax Highlighting
Plugin 'vim-pandoc/vim-pandoc-syntax'

" End Plugin Definition
call vundle#end()
filetype plugin indent on
set autoindent

" =========== SYNTAX HIGHLIGHTING =============
" THE BASICS
" Enable It
syntax on

" COLOR SCHEME
colorscheme gruvbox
" Dark Background
set background=dark

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

" Indentation
" Sane tabstop
set tabstop=2
set shiftwidth=2
" Indentation marker character
let g:indentLine_char = '|'
" Enable indent lines by default
let g:indentLine_enabled = 1
" Use spaces instead of tabs
set expandtab

" DELETING
" Make Backspace Act Normal
set backspace=2

" SPLITTING
" Open splits intutiively
set splitbelow
set splitright

" HIGHLIGHTING
" Highlight All Search Results
set hlsearch
" Highlight Words Over 80 Characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" SYNTAX CHECKING [Syntastic]
" My Compiler
let g:syntastic_cpp_compiler = 'clang++'
" Use C++ 14
let g:syntastic_cpp_compiler_options = ' -std=c++1z'

" AUTO COMPLETE
" Silence Autocomplete Warnings
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Disable Preview Window
set completeopt-=preview

" LaTeX
" Set Preview As the Default LaTeX Viewer
let g:livepreview_previewer = 'open -a Preview'
" Don't convert symbols
let g:tex_conceal = ""

" MACVIM
" Enable Powerline
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Roboto\ Mono\ for\ Powerline:h12
   endif
endif

" GIT [GitGutter]
" Enabled by Default
let g:gitgutter_enabled = 1
" Update time for checking Git
set updatetime=250

" JS
" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" =============== EDITOR MACROS ===============
" SETUP
" SPACE LEADER
let mapleader="\<Space>"
" Use Semicolon for Command Mode
" nnoremap ; :
" Navigate up and down through wrapped lines naturally
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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
map <Leader>et :e ~/Dropbox/Todo/todo.vim<CR>
" Edit UPEL Task List
map <Leader>eu :e ~/Dropbox/Todo/upel.vim<CR>

" TAB MANAGEMENT
" Open a New Tab
map <Leader>t :tabe<CR>

" SPLIT CREATION
" Enable splitting in each direction
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>

" SPLIT MANAGEMENT
" Navigate Up
nnoremap <Leader>k <C-w>k
" Navigate Down
nnoremap <Leader>j <C-w>j
" Navigate Left
nnoremap <Leader>h <C-w>h
" Navigate Right
nnoremap <Leader>l <C-w>l

" HIGHLIGHT MANAGEMENT
" Turn off highlighting
map <Leader>D :match none<CR>

" NERD TREE
" Show/Hide NERD Tree
map <Leader>f :NERDTreeToggle<CR><C-l>
" Go to NERD Tree
map <Leader>F :NERDTree<CR>

" GIT
" Show/Hide GitGutter
map <Leader>gg :GitGutterToggle<CR>
" Stage Current File
map <Leader>ga :Gwrite<CR>
" Commit Changes
map <Leader>gc :Gcommit -v<CR>
" Push Changes
map <Leader>gp :!git push origin master<CR>

" COMPILING/RUNNING
" Compile Pandoc
map <Leader>p :!pandoc --from markdown+fancy_lists *.md --variable urlcolor=cyan -o out.pdf<CR>
" Run In Python 3
map <Leader>P :w !python3<CR>
" Run In Node
map <Leader>N :w !node<CR>
" Set Up Cmake in CWD
map <Leader>C :! cp -r ~/.cmake/* ./; cmake .<CR>
" Compile C++
map <Leader>c :make<CR>
" Compile Rust
map <Leader>ru :!rustc ./*.rs -o run<CR>
" Run Rust
map <Leader>rr :!./run<CR>
" Run Gulp default task (Used for compiling JS)
map <Leader>gu :!gulp<CR>
" Compile SCSS
map <Leader>gs :!gulp compileCSS<CR>
" Compile JS
map <Leader>gj :!gulp compileJS<CR>
" Compile Doc
map <Leader>gd :!gulp document<CR>
" Lint Client
map <Leader>glc :!gulp lintClient<CR>
" Lint Server
map <Leader>gln :!gulp lintNode<CR>
" Run Compiled C++
map <Leader>R :!./run<CR>
" Generate cout from comment
map <Leader>o 0/\/<CR>velcstd::cout << "<esc>$a\n";<esc>:nohl<CR><C-l>
" Turn cout into comment
map <Leader>O 0/std<CR>v5ec// <esc>$v3hx:nohl<CR><C-l>
" Bring up quickfix
" map <Leader>F :cope<CR>
" Next fix
" map <Leader>n :cn<CR>
" Previous fix
" map <Leader>N :cp<CR>
" Grep for TODO statements
map <Leader>T :vimgrep "TODO" ./* -r<CR>

" SEARCHING/HIGHLIGHTING
" Clear Highlights and Redraw
map <Leader>d :nohl<CR><C-l>

" VIEW CHANGING
" Toggle indent lines
map <Leader>i :IndentLinesToggle<CR>

" LaTeX
map <Leader>lp :LLPStartPreview<CR>

" Config
map <Leader>r :so ~/.vimrc<CR>

" ============= CRYPTOGRAPHY SETUP =============
" MAIN CRYPTO
" Use Strong-Ish Algorithm
:setlocal cm=blowfish
