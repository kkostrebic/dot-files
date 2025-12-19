set nocompatible              " be iMproved, required
filetype off                  " required
let g:mapleader=','


set number relativenumber
set autoread

" default regexp engine:
" 	The possible values are:
" 		0	automatic selection
" 		1	old engine
" 		2	NFA engine
" NOTE: there are issues and vim is becoming painfully slow when opening
" typescript files if this value is set to 1, so let's use automatic settings
" which decides what's best engine for different cases
set regexpengine=0


" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.1

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" packadd! matchit

" Plug (plugin manager)
"===============================================================================
" NOTE: Download plug.vim and put it in the "autoload" directory, i.e.
" 	    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
" Directory and file navigation plugin
" Plugin 'scrooloose/nerdtree'

" git plugin
Plug 'tpope/vim-fugitive'
" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-flagship'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Fuzzy file, buffer, mru, tag, etc. finder
Plug 'ctrlpvim/ctrlp.vim'

" Provides linting (syntax checking and semantic errors) while you edit your
" text files, and acts as a Vim Language Server Protocol client
Plug 'dense-analysis/ale'

" Edit large files quickly
Plug 'vim-scripts/LargeFile'

" Search in files 
Plug 'mileszs/ack.vim'

" Support for expanding abbreviations for html & css
Plug 'mattn/emmet-vim'

" A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Color theme
Plug 'NLKNguyen/papercolor-theme'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
" current file and get an overview of its structure.
Plug 'preservim/tagbar'

" A Vim plugin that manages your tag files (using ctags)
Plug 'ludovicchabant/vim-gutentags'

" Personal Wiki for Vim 
Plug 'vimwiki/vimwiki'

" automatically synchronize Vimwiki notes directory on Vimwiki startup and exit
" using Git
Plug 'michal-h21/vimwiki-sync'

" color name highlighter
Plug 'ap/vim-css-color'

" Multiple cursors plugin for vim/neovim
Plug 'mg979/vim-visual-multi'

" allows you to select some text using Vim's visual mode and then hit * and #
" to search for it elsewhere in the file
Plug 'nelstrom/vim-visual-star-search'

"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'mattn/vim-lsp-settings'

" Plugin 'tpope/vim-bundler'

" Plug 'github/copilot.vim'

" **All of your Plugins must be added before the following line**

call plug#end()            " required
"===============================================================================


" Shortcuts
"===============================================================================
" Delete the buffer but keep the split (take the previous opened buffer)
nmap <Leader>d :b#<bar>bd#<CR>

" List all open buffers
nmap <Leader>b :CtrlPBuffer<CR>

" Remove matched highlights
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Show list of tags for the current open file
nmap <F8> :TagbarToggle<CR>

" Open/Close file explorer
" - in vertical split ( | char )
nmap <bar> :Vexplore<CR>
" - in horizontal split ( - char )
nmap - :Sexplore<CR>
nmap <C-N> :Explore<CR>

" Fix issues within current buffer, e.g. trim white spaces
noremap <F3> :ALEFix<CR>

" Search in files
nnoremap <Leader>f :Ack!<Space>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <S-CR> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"===============================================================================


" CtrlP
"===============================================================================

" do not show/ignore searching files 
let g:ctrlp_custom_ignore = {
\  'dir': '\v[\/]node_modules$'
\}

" maximum number of files to scan
let g:ctrlp_max_files = 20000

" maximum depth of a directory tree to recurse into
let g:ctrlp_max_depth = 40
"===============================================================================



" ALE
"===============================================================================

" dependencies:
" rubocop (rvm @global do gem install rubocop)
" yamllint (apt install yamllint)
" prettier (npm --global install prettier)
" tidy (apt install tidy)
" shfmt (go get -u mvdan.cc/sh/cmd/shfmt)

" All shortcuts are defined in same place (this commented one is just for the
" reference for this plugin)
" noremap <F3> :ALEFix<CR>

let g:ale_set_balloons = 0
let g:ale_completion_enabled = 0


let g:ale_fixers = {
\ '*':    ["trim_whitespace"],
\ 'html': ['tidy'],
\ 'xml':  ['xmllint'],
\ 'css':  ['prettier'],
\ 'scss': ['prettier'],
\ 'less': ['prettier'],
\}
let g:ale_linters = {
\ 'html':       ['tidy','prettier'],
\ 'xml':        ['xmllint'],
\ 'javascript': ['prettier'],
\ 'json':       ['prettier'],
\ 'less':       ['prettier'],
\ 'scss':       ['prettier'],
\ 'ruby':       ['rubocop'],
\ 'yaml':       ['yamllint'],
\ 'bash':       ['shellcheck'],
\ 'typescript': ['prettier'],
\ 'markdown':   ['prettier'],
\ 'dockerfile': ['hadolint']
\}
"===============================================================================


" set cursorline                  " highlight current line
set mouse=a                       " mouse functionality enabled
set ttymouse=sgr                  " mouse support in vim
set showmatch                     " highlight matching [{()}]
set foldmethod=syntax

syntax enable

" General
set number                        " Show line numbers
set showmatch                     " Highlight matching brace
set visualbell                    " Use visual bell (no beeping)

set hlsearch                      " Highlight all search results
set smartcase                     " Enable smart-case search
set ignorecase                    " Always case-insensitive
set incsearch                     " Searches for strings incrementally
set scrolloff=5                   " Minimal number of screen lines to keep above and below the cursor
set sidescroll=1                  " Minimal number of columns to scroll horizontally
set sidescrolloff=5               " Minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
" set listchars=eol:←,tab:→→,space:⋅,nbsp:␣,trail:⒈,extends:▶,precedes:◀ " How whitespace chars will be shown with `:set list` command

set autoindent                    " Auto-indent new lines
set expandtab                     " Use spaces instead of tabs
set shiftwidth=2                  " Number of auto-indent spaces
set smartindent                   " Enable smart-indent
set smarttab                      " Enable smart-tabs
set softtabstop=2                 " Number of spaces per Tab
set tabstop=2
set directory=$HOME/.vim/swp//    " Place where vim will keep its swap files (NOTE: Make sure directory exists)

set clipboard=unnamedplus " use the system clipboard

" background to dark to keep same color schema when using vim in tmux
set t_Co=256    " make sure that terminal has 256 colors enabled
set background=dark

colorscheme PaperColor   " set colorscheme

set colorcolumn=80

" Advanced
set confirm                    " Prompt confirmation dialogs
set ruler                      " Show row and column ruler information

set backspace=indent,eol,start " Backspace behaviour

set laststatus=2               " show status bar all the time
set nowrap                     " do not wrap long lines"

" override gui background color from colorscheme (set it to black)
highlight Normal   ctermbg=0 guibg=#000000 " set it to black

highlight Pmenu    ctermfg=0 ctermbg=15
highlight PmenuSel ctermfg=0 ctermbg=7


" Ack settings
"===============================================================================

" All shortcuts are defined in same place (this commented one is just for the
" reference for this plugin)
" nnoremap <Leader>f :Ack!<Space>

" Use ripgrep (in case it's there) for text search 
if executable('rg')
  let g:ackprg = 'rg --smart-case --sort path --vimgrep'
endif
"===============================================================================


" Status line definition
"===============================================================================
set statusline=[%n]
set statusline+=\ %f                                           " filename
set statusline+=\ %h%m%r                                    " help buffer tag, modified tag, read only tag
set statusline+=%=                                          " separator left-right side of status line
" set statusline+=%{gutentags#statusline()}                   " know when gutentags is generating tags
set statusline+=\ %l/%L:%c                                  " line-number of total-number-of-lines:column-number
set statusline+=\ [0x%B]                                    " unicode value of the characted under the cursor
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  " file encoding
set statusline+=\ [%{&ff}]                                  " file format
"===============================================================================

" Modification of complete functionality (so it looks more like the autocomplete from IDEs)
set completeopt=longest,menuone

let g:buftabline_numbers = 1 " show buffer numbers in tab line

" search for tags file up to home directory
set tags+=tags;$HOME

" let g:AutoPairsFlyMode = 1

hi TabLineSel   guibg=DarkGreen guifg=White
hi TabLine      guibg=Black     guifg=Gray
hi StatusLine   ctermbg=0 ctermfg=10 guibg=Black     guifg=Green
hi StatusLineNC ctermbg=4 ctermfg=8 guibg=DarkRed   guifg=DarkGray

au BufNewFile,BufRead Jenkinsfile* setf groovy
au BufNewFile,BufRead *.service    setf systemd
au BufNewFile,BufRead *.unit       setf systemd
au BufNewFile,BufRead *.timer      setf systemd

" Set netrw settings for a customized width
let g:netrw_liststyle = 3         " Tree-like view
let g:netrw_winsize = -40         " Set width to 40 chars
nmap ,e :Lexplore<CR>



" Visual-Multi
"===============================================================================
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-A-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-A-n>'           " replace visual C-n
"===============================================================================


" Vimwiki 
"===============================================================================
let wiki_1                  = {}
let wiki_1.name             = 'Wiki'
let wiki_1.path             = '~/projects/wiki/'
let wiki_1.syntax           = 'markdown'
let wiki_1.ext              = '.md'
let wiki_1.links_space_char = '-'
let wiki_1.index            = 'index'

let wiki_2                  = {}
let wiki_2.name             = 'Private'
let wiki_2.path             = '~/projects/wiki/private'
let wiki_2.syntax           = 'markdown'
let wiki_2.ext              = '.md'
let wiki_2.links_space_char = '-'
let wiki_2.index            = 'index'

let wiki_3                  = {}
let wiki_3.name             = 'Tasks'
let wiki_3.path             = '~/projects/wiki/tasks'
let wiki_3.syntax           = 'markdown'
let wiki_3.ext              = '.md'
let wiki_3.links_space_char = '-'
let wiki_3.index            = 'index'

let g:vimwiki_list          = [wiki_1, wiki_2, wiki_3]
"===============================================================================


" Gutentags
"===============================================================================
let g:gutentags_project_root = ['.git']
"===============================================================================
