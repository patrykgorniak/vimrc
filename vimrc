"-----------VUNDLE SECTION---------------"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips',
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic' " syntax checking tool
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/fonts',
Plugin 'rhysd/vim-clang-format',
Plugin 'vim-airline/vim-airline',
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline',
Plugin 'tpope/vim-commentary',
Plugin 'bronson/vim-trailing-whitespace',
Plugin 'majutsushi/tagbar',
Plugin 'scrooloose/nerdtree',
Plugin 'jistr/vim-nerdtree-tabs.git',
Plugin 'a.vim',
Plugin 'bufexplorer.zip',
Plugin 'Colour-Sampler-Pack',
Plugin 'sheerun/vim-polyglot',
Plugin 'airblade/vim-gitgutter',
Plugin 'ctrlpvim/ctrlp.vim',
Plugin 'xolox/vim-session',
Plugin 'xolox/vim-misc',
Plugin 'Shougo/vimshell.vim',
Plugin 'Shougo/vimproc.vim',
Plugin 'fugitive.vim',
Plugin 'vim-scripts/c.vim',
Plugin 'jaxbot/semantic-highlight.vim',
Plugin 'Townk/vim-autoclose'

"Plugin 'FuzzyFinder',
"Plugin 'matchit.zip',
"Plugin 'surround.vim',
"Plugin 'jalcine/cmake.vim',
"Plugin 'headerguard.vim',
"Plugin 'CCTree',
"Plugin 'DfrankUtil',
"Plugin 'vimprj',
"Plugin 'tComment',
"Plugin 'https://github.com/klen/python-mode'
call vundle#end()

" ------------GENERAL SECTION------------"
filetype plugin indent on
filetype indent on
autocmd! BufWritePost .vimrc source %

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

""  Keep files centralized, don't create swapfiles
set noswapfile
set nobackup

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash
noremap <leader>sh :VimShellCreate <CR>
" noremap <leader>sc :VimShellClose <CR>

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
  autocmd BufEnter,BufWrite,BufRead *.py,*.cpp,*.c,*.h,*.hpp :SemanticHighlight
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

:autocmd CursorMoved *.cpp,*.c,*.hpp,*.h exe printf('match MatchParen /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" "" txt
" augroup vimrc-wrapping
"   autocmd!
"   autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
" augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set number
set ruler

set sc
set cursorline
set mouse=a
set laststatus=2
" set bs=2
set autoindent
" set foldmethod=syntax  "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use
set textwidth=120
" set autowrite
set autoread
set nowrap
" set splitright
" set history=700
" set undolevels=700
colorscheme herald
" hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=gray guifg=black
" au BufRead,BufNewFile *.logcat set filetype=logcat

"----------------ShortCuts----------------"
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR> 
noremap <c-s-down> ddp

noremap <C-right> <Esc><C-W>l
noremap <C-up> <Esc><C-W>k
noremap <C-down> <Esc><C-W>j
noremap <C-left> <Esc><C-W>h

vnoremap < <gv
vnoremap > >gv

"Next/Prev buffer
noremap <leader>n :bn<CR>
noremap <leader>p :bp<CR>
"Close buffer
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

noremap <F4> :A<CR>
noremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>
nnoremap <Esc> :nohl<CR>

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
"-------------- Mark unwanted spaces --------------"
":highlight ExtraWhitespace ctermbg=red guibg=red
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/

" ------------YouCompleteMe SECTION-----------------"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" "-------------------- vim-airline ------------------"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" " ---------------- UltiSnips ---------------------------"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" " ----------------shortcut---------------------------"
"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Shortcuts
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F5> :NERDTreeToggle<CR>

noremap <F6> :TagbarOpenAutoClose<CR><CR>
let g:tagbar_autofocus = 1

noremap <F10> :BufExplorer <CR>

" "------------- Make shortcuts and quickFix window with errors ------------------"
set makeprg=make\ -C\ build
map <C-B> :make<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
set errorformat=%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ for\ each\ function\ it\ appears\ in.),%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file\ included\ from\ %f:%l:%c,%-GIn\ file\ included\ from\ %f:%l,%-Gfrom\ %f:%l:%c,%-Gfrom\ %f:%l,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f,%f\|%l\|\ %m

" ------------clang-format SECTION--------------"
" map to <CTRL + I> in C++ code
let g:clang_format#style_options = {
		\ "BasedOnStyle" : "Google",
		\ "ColumnLimit" : 140 }
autocmd FileType c,cpp,objc nnoremap <C-i> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <C-i> :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" ------------Syntastic SECTION-----------------"
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_cpp_checkers=['ycm', 'cpplint']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_auto_loc_list=1

" ------------CTAGS SECTION------------"
map <C-F12> :!ctags -R --sort=1 --c++-kinds=+pl --fields=+iaS --extra=+q --extra=+f . && cscope -Rb <CR>

if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline\ 10

  " if $COLORTERM == 'gnome-terminal'
  "   set term=gnome-256color
  " else
  "   if $TERM == 'xterm'
  "     set term=xterm-256color
  "   endif
  " endif

endif

if &term =~ '256color'
  set t_ut=
endif

" if has("gui_running")
"     set t_Co=256
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    " add any cscope database in current directory
    if filereadable("cscope.out")
		cs kill 0
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	
"if has("win32unix")
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"elseif has("gui_running")
"    nmap <C-S-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-S-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-S-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-S-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-S-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-S-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-S-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-S-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
"
"    nmap <C-S-Space><C-S-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-S-Space><C-S-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-S-Space><C-S-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-S-Space><C-S-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-S-Space><C-S-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-S-Space><C-S-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-S-Space><C-S-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-S-Space><C-S-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"
"endif


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif


"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
