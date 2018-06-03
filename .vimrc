set nocompatible              " be iMproved, required
filetype off                  " required
let g:mapleader=','


" ============================== 
" === autoread functionality ===
" ============================== 

" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  " echo msg
  let @"=reg_saved
endfunction

" ============================== 
" = end autoread functionality =
" ============================== 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Directory and file navigation plugin
Plugin 'scrooloose/nerdtree'
" Plugin 'Shougo/vimfiler.vim'
" Plugin 'tpope/vim-vinegar.git'

" git plugin
Plugin 'tpope/vim-fugitive'
" rails.vim: Ruby on Rails power tools
Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'

" Fuzzy file, buffer, mru, tag, etc. finder
Plugin 'ctrlpvim/ctrlp.vim'

" c++ syntax highlighting
" Plugin 'octol/vim-cpp-enhanced-highlight'

" Database access to many DMBS
Plugin 'dbext.vim'

" Elegant buffer explorer
Plugin 'fholgado/minibufexpl.vim'

" Provide easy code formatting
Plugin 'Chiel92/vim-autoformat'

" A CODE-COMPLETION ENGINE FOR VIM
" Plugin 'valloric/youcompleteme'

" A Vim plugin which shows a git diff in the gutter (sign column) 
" Plugin 'airblade/vim-gitgutter'

" Edit large files quickly
Plugin 'vim-scripts/LargeFile'

" Search in files 
Plugin 'mileszs/ack.vim'

" New railscasts theme 
Plugin 'carakan/new-railscasts-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


map <C-n> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>

set mouse=a             " mouse functionality enabled
" set cursorline          " highlight current line
set foldmethod=syntax
      " 80 character mark
set ttymouse=xterm2     " mouse support in vim (for iTerm)

" set color to 80 character mark
autocmd BufRead * if @% != 'Result' | highlight ColorColumn ctermbg=DarkGray | else | set colorcolumn=80 | endif 
autocmd BufRead * normal zR

set showmatch           " highlight matching [{()}]

syntax enable

" General
set number    		" Show line numbers
set showmatch    	" Highlight matching brace
set visualbell		" Use visual bell (no beeping)

set hlsearch   		" Highlight all search results
set smartcase    	" Enable smart-case search
set ignorecase    	" Always case-insensitive
set incsearch    	" Searches for strings incrementally

set autoindent    	" Auto-indent new lines
set expandtab    	" Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent    	" Enable smart-indent
set smarttab    	" Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
set tabstop=2   

set clipboard=unnamed,unnamedplus         " use the system clipboard

" background to dark to keep same color schema when using vim in tmux
set t_Co=256 " make sure that terminal has 256 colros enabled
" set background=dark
colorscheme new-railscasts " set new-railscasts colorscheme

" ============================== 
" === autoread functionality ===
" ============================== 
let autoreadargs={'autoread':1} 
execute WatchForChanges("*",autoreadargs) 
" ============================== 
" = end autoread functionality =
" ============================== 

" Advanced
set confirm    		" Prompt confirmation dialogs
set ruler    		" Show row and column ruler information

set backspace=indent,eol,start    " Backspace behaviour

set laststatus=2    " show status bar all the time
set nowrap          " do not wrap long lines"

let NERDTreeShowHidden=1    " show hidden files in NERDTree

highlight Pmenu ctermfg=0 ctermbg=15
highlight PmenuSel ctermfg=0 ctermbg=7

" Use ripgrep (in case it's there) for text search 
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
