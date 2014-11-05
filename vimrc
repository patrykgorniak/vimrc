"-----------VUNDLE SECTION---------------"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Lokaltog/vim-easymotion' 
"Plugin 'L9'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'taglist.vim',
Plugin 'https://github.com/scrooloose/nerdtree',
Plugin 'SirVer/ultisnips',
Plugin 'honza/vim-snippets'
Plugin 'a.vim',
Plugin 'bufexplorer.zip',
Plugin 'Colour-Sampler-Pack',
Plugin 'ctrlp.vim',
"Plugin 'FuzzyFinder',
"Plugin 'matchit.zip',
"Plugin 'surround.vim',
"Plugin 'jalcine/cmake.vim',
"Plugin 'headerguard.vim',
"Plugin 'CCTree',
"Plugin 'DfrankUtil',
"Plugin 'vimprj',
"Plugin 'tComment',
"Plugin 'fugitive.vim',
"Plugin 'git.zip',
"Plugin 'vim-ruby/vim-ruby',
"Plugin 'Solarized',
"Plugin 'https://github.com/klen/python-mode'
call vundle#end()

" ------------GENERAL SECTION------------"
filetype plugin indent on
autocmd! BufWritePost .vimrc source %
filetype indent on
syntax on
set number
set ruler
set cursorline
set mouse=a
set bs=2
set hlsearch
set autoindent
set foldmethod=syntax  "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=120
set autowrite
set nowrap
set splitright
let mapleader = ","
set history=700
set undolevels=700
set incsearch
colorscheme fu
hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=gray guifg=black
au BufRead,BufNewFile *.logcat set filetype=logcat

"----------------ShortCuts----------------"

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

noremap <C-right> <Esc><C-W>l
noremap <C-up> <Esc><C-W>k
noremap <C-down> <Esc><C-W>j
noremap <C-left> <Esc><C-W>h

vnoremap < <gv
vnoremap > >gv

noremap <c-x> :Bclose!<CR>
noremap <F4> :A<CR>
noremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

nnoremap <esc> :nohl<CR>
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"-------------- Mark unwanted spaces --------------"
:highlight ExtraWhitespace ctermbg=red guibg=red
":autocmd ColorScheme fu highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" ---------------- UltiSnips ---------------------------"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ----------------TlistToggle and NERDTreeToggle shortcut---------------------------"
map <C-F6> :NERDTreeToggle <CR><CR>
map <C-F5> :TlistToggle <CR><CR>
map <C-F10> :BufExplorer <CR>
map <C-F9> :CCTreeLoadDB <CR><CR>
" map <C-B> :make <CR>

" ------------YouCompleteMe SECTION-----------------"
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_previous_completion=['<Up>']
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']


" ------------TLIST_SECTION-----------------"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;c:class;g:enum;s:struct;u:union;f:function;m:member;p:prototype'

"------ Keep files centralized, don't create swapfiles
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile

" ------------Syntastic SECTION-----------------"
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_checkers=['ycm', 'cpplint']

" ------------CTAGS SECTION------------"
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f . && cscope -Rb <CR>


"-----------PowerLine SECTION---------------"
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8


if has("gui_running")
    set t_Co=256
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 10
endif










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
