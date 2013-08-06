"-----------VUNDLE SECTION---------------"
set nocompatible               " be iMproved
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'taglist.vim',
Bundle 'nerdtree',
Bundle 'SirVer/ultisnips',
Bundle 'FuzzyFinder',
Bundle 'a.vim',
Bundle 'bufexplorer.zip',
Bundle 'jalcine/cmake.vim',
Bundle 'headerguard.vim',
Bundle 'CCTree',


" ------------GENERAL SECTION------------"
set t_Co=256
filetype plugin indent on     " required!

au BufRead,BufNewFile *.logcat set filetype=logcat
set number
set ruler
:syntax on
set cursorline
set mouse=a
set hlsearch
set autoindent
set foldmethod=syntax  "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set autoindent  " noautoindent
set tabstop=8
set shiftwidth=8
set textwidth=120
set expandtab
set autowrite
:hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=gray guifg=black
" ------------CTAGS SECTION------------"
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f -f .vimprj/<CR> 
set tags=.vimprj/tags

" TlistToggle and NERDTreeToggle shortcut
map <C-F6> :NERDTreeToggle <CR><CR>
map <C-F5> :TlistToggle <CR><CR>
map <C-F10> :BufExplorer <CR>
map <C-F9> :CCTreeLoadDB <CR><CR>
map <C-B> :make <CR>:

:let Tlist_Show_One_File = 1
:let Tlist_Exit_OnlyWindow = 1
:let Tlist_Use_Right_Window = 1
let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;c:class;g:enum;s:struct;u:union;f:function;m:member;p:prototype'

let g:CCTreeKeyTraceForwardTree = '<C-p>' 
let g:CCTreeKeyTraceReverseTree = '<C-o>' 
let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
let g:CCTreeKeyToggleWindow = '<C-F7>' 
let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
let g:CCTreeKeyDepthPlus = '<C-\>=' 
let g:CCTreeKeyDepthMinus = '<C-\>-'
let g:CCTreeWindowWidth = 40

:let Grep_Default_Filelist = '*.c *.cpp *.asm *.java *.aidl' 
set listchars=tab:>-,trail:-
set list

set tags+=.vimprj/tags,./tags

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp
noremap <C-right> <Esc><C-W>l
noremap <C-up> <Esc><C-W>k
noremap <C-down> <Esc><C-W>j
noremap <C-left> <Esc><C-W>h
inoremap <c-s> <c-o>:w<CR>
noremap <c-s> :w<CR>
noremap <c-x> :Bclose!<CR>
noremap <F4> :A<CR>
nnoremap <esc> :noh<CR>
map <C-i> :%!astyle -A4<CR>

if has("gui_running")
  set guifont=Ubuntu\ Mono\ for\ Powerline\ 10
  set lines=45 columns=120
endif

" ------------YouCompleteMe SECTION-----------------"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_previous_completion=['<Up>']
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ------------Syntastic SECTION-----------------"
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_checkers=['ycm', 'cpplint']

"-----------PowerLine SECTION---------------"
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8

"-----------UltiSnip  SECTION---------------"
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets = '<c-l>'

colorscheme fu

"--------------------------------------------"
" Keep files centralized, don't create swapfiles
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile

" Show search match while typing
set incsearch

"-------------Fuzzy Finder--------------------
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400

nnoremap <silent> <C-f>f :FufFile<CR>
nnoremap <silent> <C-f>b :FufBuffer<CR>
nnoremap <silent> <C-f>t :FufTag<CR>
nnoremap <silent> <C-f>T :FufTagWithCursorWord!<CR>


"--------------Fugitive-----------------------
nnoremap <silent> <C-g>s :Gstatus<CR>


"---------------QuickFix----------------------
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
