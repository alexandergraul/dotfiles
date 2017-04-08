" General

" Sets how many lines of history VIM has to remember
set history=1000

 " Enable filetype plugins
 filetype plugin on
 filetype indent on

 " Set to auto read when a file is changed from the outside
 set autoread

 " Set leader to ","
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


" VIM user interface

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
"set wildmenu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    else
        set wildignore+=.git\*,.hg\*,.svn\*
    endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1


" Colors and Fonts

" Enable syntax highlighting
syntax enable 
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" Files, backups and undo

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"  Visual mode related

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"  Moving around, tabs, windows and buffers

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
" Remember info about open buffers on close
" set viminfo^=%


" Status line

" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


" Editing mappings

" Remap VIM 0 to first non-blank character
"map 0 ^


" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Ag searching and cope displaying
    "    requires ag.vim - it's much better than vimgrep/grep
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " When you press gv you Ag after the selected text
    "vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

    " Open Ag and put the cursor in the right position
    "map <leader>g :Ag 

    " When you press <leader>r you can search and replace the selected text
    "vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with Ag, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    "map <leader>cc :botright cope<cr>
    "map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    "map <leader>n :cn<cr>
    "map <leader>p :cp<cr>


" Spell checking

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" Misc
    
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>




" Helper functions

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction 

    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("Ag \"" . l:pattern . "\" " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
        return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" show line numbers
set number
set relativenumber

"vim-plug
call plug#begin('~/.vim/plugged')
" utility
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
" colorschemes
Plug 'danilo-augusto/vim-afterglow'
Plug 'jacoborus/tender'
Plug 'morhetz/gruvbox'
Plug 'fneu/breezy'
Plug 'zandrmartin/vim-distinguished'
Plug 'altercation/vim-colors-solarized'
Plug 'fcpg/vim-fahrenheit'
call plug#end()

" quick open nerdtree
map <C-n> :NERDTreeToggle<CR>
" ingore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 
"let python_highlight_all=1
syntax on
set background=dark
colo breezy 
"colo solarized

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [  [ 'mode', 'paste'],
    \               [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
" remove default status (-- INSERT--)
set noshowmode
" save on :make (vim-go)
set autowrite
