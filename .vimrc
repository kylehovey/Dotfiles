" Kyle Hovey's Vim Dotfile

" ================ SYSTEM ================
" THE BASICS
set t_Co=256               " Make sure terminal is 256 colors
set clipboard+=unnamedplus " Set the system clipboard
set mouse=a                " Enable Mouse Support
set belloff=all            " Disable bell
set shell=zsh              " Shell is ZSH

" =========== PLUGIN MANAGER =============
set nocompatible                  " Be iMproved, Required
filetype off                      " Required

call plug#begin('~/.vim/plugged')

" Editor Features
Plug 'tpope/vim-surround'                                    " Surround
Plug 'tpope/vim-repeat'                                      " Repeat with .
Plug 'tomtom/tcomment_vim'                                   " Commenting
Plug 'neoclide/coc.nvim' , {'branch': 'release'}             " Auto Complete With LSP
Plug 'lukas-reineke/indent-blankline.nvim'                   " Indentation Highlighting

" IDE Features
Plug 'vim-airline/vim-airline'                               " Nice Status Bar
Plug 'scrooloose/nerdtree'                                   " NERD Tree File Browser
Plug 'ryanoasis/vim-devicons'                                " NERD Tree DevIcons
Plug 'nvim-lua/plenary.nvim'                                 " Dependency for Telescope
Plug 'nvim-telescope/telescope-file-browser.nvim'            " Telescope File Browser
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }     " Searching Modal
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Incremental Language Parser

" Git
Plug 'tpope/vim-fugitive'                                    " Git Integration
Plug 'airblade/vim-gitgutter'                                " Git Diff
Plug 'Xuyuanp/nerdtree-git-plugin'                           " NerdTree Git Integration
Plug 'zivyangll/git-blame.vim'                               " Git Blame
Plug 'ruanyl/vim-gh-line'                                    " Open Selection in GitHub
Plug 'kdheepak/lazygit.nvim'                                 " LazyGit support

" Themes
Plug 'morhetz/gruvbox'                                       " Gruvbox Color Scheme
Plug 'nvim-tree/nvim-web-devicons'                           " Pretty Icons

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'                                  " Many Languages
Plug 'lilydjwg/colorizer'                                    " Color Highlighting

" Language Support
Plug 'tpope/vim-rails'                                       " Rails Support
Plug 'posva/vim-vue'                                         " Vue Syntax Highlighting
Plug 'leafOfTree/vim-svelte-plugin'                          " Svelte Syntax
Plug 'elm-tooling/elm-vim'                                   " Elm
Plug 'vim-latex/vim-latex'                                   " Vim LaTeX
Plug 'vim-pandoc/vim-pandoc'                                 " Vim PanDoc
Plug 'vim-pandoc/vim-pandoc-syntax'                          " Vim PanDoc
Plug 'JuliaEditorSupport/julia-vim'                          " Vim Julia Support
Plug 'godlygeek/tabular'                                     " Required for Markdown support
Plug 'plasticboy/vim-markdown'                               " Markdown support
Plug 'vimwiki/vimwiki'                                       " Vim Wiki
Plug 'timtro/glslView-nvim'                                  " GLSL Viewer Support

" ============== CoC EXTENSIONS ==============
" * coc-prettier 9.3.1
" * coc-html 1.7.0
" * coc-eslint 1.5.8
" + coc-yaml 1.9.0
" + coc-tsserver 1.12.0
" + coc-svelte 0.4.2
" + coc-sh 0.7.0
" + coc-pyright 1.1.275
" + coc-markdownlint 1.26.0
" + coc-julia 0.13.1
" + coc-json 1.7.0
" + coc-java 1.5.5
" + coc-css 1.3.0

call plug#end()

" =========== SYNTAX HIGHLIGHTING =============
" THE BASICS
" Enable It
syntax on

" COLOR SCHEME
colorscheme gruvbox
" Dark Background
set background=dark

" ============== STATUS SECTIONS =================
" Show the Tab Line When We Need It
" set showtabline=1

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
" Eneable indenting and filetype detection
filetype plugin indent on
set autoindent
" Sane tabstop
set tabstop=2
set shiftwidth=2
" Use spaces instead of tabs
set expandtab

" DELETING
" Make Backspace Act Normal
set backspace=2

" SPLITTING
" Open splits intuitively
set splitbelow
set splitright

" HIGHLIGHTING
" Highlight All Search Results
set hlsearch
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" File auto-format on save
autocmd FileType haskell autocmd call CocAction('format')
let g:haskell_indent_disable=1

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Don't open scratch buffers for hints
set completeopt-=preview
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Svelte
" Enable Typescript
let g:vim_svelte_plugin_use_typescript = 1

" LaTeX
" Set Preview As the Default LaTeX Viewer
let g:livepreview_previewer = 'open -a Preview'
" Don't convert symbols
let g:tex_conceal = ""
" And please don't add text I didn't type...
let g:Imap_FreezeImap=1
" Send errors to black hole
let g:Tex_ViewRule_pdf='evince 2>/dev/null'
" Stop the linter and warnings
let g:Tex_IgnoreLevel = 8

" GIT [GitGutter]
" Enabled by Default
let g:gitgutter_enabled = 1
" Update time for checking Git
set updatetime=250

" JS
" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" ACK/AG
" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" =============== EDITOR MACROS ===============
" SPACE LEADER
let mapleader="\<Space>"
" Navigate up and down through wrapped lines naturally
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Timeout for key codes

" FILE I/O
" Save
nnoremap ; :w<CR>
" Save As
map <Leader>W :w<Space>
" Quit Vim
map <Leader>q :q<CR>
map <Leader>Q :q!<CR>

" SPELL CHECKING
map <Leader>w z=1<CR>

" SESSIONS
" Create new session
map <Leader>sc :mks ~/.vim/sessions/.vim<Left><Left><Left><Left>
" Save session
map <Leader>ss :mks!<CR>
" Load session
map <Leader>sl :source ~/.vim/sessions/

" FILE SHORTCUTS
" Edit .vimrc
map <Leader>ev :e ~/.vimrc<CR>

" TAB MANAGEMENT
" Open a New Tab
map <Leader>t :tabe<CR>

" SPLIT CREATION
" Enable splitting in each direction
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>

" SPLIT MANAGEMENT
" Zoom / Restore window.
" https://stackoverflow.com/a/26551079/9843390
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

" Navigate Up
nnoremap <Leader>k <C-w>k
" Navigate Down
nnoremap <Leader>j <C-w>j
" Navigate Left
nnoremap <Leader>h <C-w>h
" Navigate Right
nnoremap <Leader>l <C-w>l
" Zoom/Unzoom Split
nnoremap <Leader><CR> :ZoomToggle<CR>
" Equalize Splits
nnoremap <Leader>= <C-w>=
" Minimize Split
nnoremap <Leader>- :vertical resize 0<CR>

" BUFFER MANAGEMENT
" Navigate to Next Buffer
nnoremap <Leader>H :bprev<CR>
" Navigate to Previous Buffer
nnoremap <Leader>L :bnext<CR>
" Reload Buffer
map <Leader>e :edit<CR>

" NERD TREE
" Go to NERD Tree
map <Leader>f :NERDTreeToggle<CR><C-l>
" Open current file in NerdTree
map <Leader>n :NERDTreeFind <CR>

" TELESCOPE
" File Browser
" map <Leader>f <cmd>Telescope file_browser<cr>
" Fuzzy-Find Files
map <Leader>F <cmd>Telescope find_files<cr>
" Search Staged Files
map <Leader>G <cmd>Telescope git_status<cr>
" Grep
map <Leader>a <cmd>Telescope live_grep<cr>
" Treesitter
map <Leader>T <cmd>Telescope treesitter<cr>

" GIT
" Show/Hide GitGutter
map <Leader>gg :GitGutterToggle<CR>
" Show Hunk Changes
map <Leader>gs <Plug>(GitGutterPreviewHunk)
" Open Lazygit
map <Leader>gl :LazyGit<CR>

" COMPILING/RUNNING
" Compile Pandoc
map <Leader>P :!pandoc --from markdown+fancy_lists *.md --variable urlcolor=cyan -o out.pdf<CR>
" Run In Python 3
map <Leader>p :w !python3<CR>
" Run In Node
map <Leader>N :w !node<CR>
" Run In Julia
map <Leader>J :w !julia<CR>
" Run In Ruby
map <Leader>bb :w !ruby<CR>
" Compile C++
map <Leader>c :make<CR>
" Compile Rust
map <Leader>ru :!rustc ./*.rs -o run<CR>
" Run Rust
map <Leader>rr :!./run<CR>
" Run Compiled C++
map <Leader>R :!./run<CR>
" Generate cout from comment
map <Leader>o 0/\/<CR>velcstd::cout << "<esc>$a\n";<esc>:nohl<CR><C-l>
" Turn cout into comment
map <Leader>O 0/std<CR>v5ec// <esc>$v3hx:nohl<CR><C-l>
" Open in GLSL Viewer
map <Leader>s :GlslView<CR>

" MARKDOWN
" Code Blocks
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'typescript', 'bash']

" SEARCHING/HIGHLIGHTING
" Clear Highlights and Redraw
map <Leader>d :nohl<CR><C-l>

" CALCULATION
" Replace visual selection with result of calculation
vmap <Leader>c :!bc<CR>

" VIEW CHANGING
" Toggle indent lines
map <Leader>i :IndentLinesToggle<CR>

" Config
map <Leader>r :so ~/.vimrc<CR>

" Lua Config
" Until this vimrc is converted to Lua, config goes here
:lua require("telescope").load_extension "file_browser"
:lua require("indent_blankline").setup { show_current_context = true, show_current_context_start = true }
:lua require('telescope').setup({ defaults = { layout_config = { vertical = { width = 0.2 }}}})
