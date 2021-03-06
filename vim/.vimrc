call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'tpope/vim-surround' " Brackets etc.
Plug 'tpope/vim-fugitive' " Git
Plug 'tpope/vim-endwise' " Ruby 'end'
Plug 'tpope/vim-bundler' " Bundler integration
Plug 'tpope/vim-rails' " Rails integration
Plug 'alvan/vim-closetag' " Close HTML tags
" Plug 'Valloric/YouCompleteMe' " Autocomplete

Plug 'scrooloose/syntastic' " syntax checker
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine' " indent guide

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'mhartington/oceanic-next'

call plug#end()

" ',' leader
let mapleader = ","
let g:mapleader = ","

" whitespace
set wrap " visual only
set linebreak " don't break words (see :h breakat)
set textwidth=79 " line lenght
set tabstop=4 " size of tab
set shiftwidth=4 " indent by autoindent
set expandtab " insert spaces in place of tabs

set number " line numbers
set relativenumber
set scrolloff=3

set matchpairs+=<:>
" % to jump between 'do' and 'end'
runtime macros/matchit.vim

" quicksave and sudo save
nmap <leader>w :w!<cr>

" theme
set termguicolors
set background=dark
"colorscheme NeoSolarized
colorscheme gruvbox

" airline config
"let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" indentLine config
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0
let g:indentLine_char = '▏'
nnoremap <leader>ig :IndentLinesToggle<cr>

" autocompletion config
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py' "see ./ycm.py for details
let g:ycm_python_binary_path = 'python3'

" move in wrapped lines
nnoremap j gj
nnoremap k gk

" split right
set splitright
" set splitbelow

" netrw (File Explorer)
let g:netrw_banner = 0
" let g:netrw_liststyle = 3 " use 'i' to cycle styles

" 0 current window (default)
" 1 horizontal split
" 2 vertical split
" 3 new tab
" 4 prev window
" let g:netrw_browse_split = 2

" size in % of width
let g:netrw_winsize = 25

" closetag
let g:closetag_filenames = '*.html, *.xhtml, *.htm, *.html.erb, *.htm.erb'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+#//e
    call cursor(l, c)
endfunction

" move between buffers
nnoremap <silent> <C-b> :silent :bp<CR>
nnoremap <silent> <C-n> :silent :bn<CR>

" open/close error list
nnoremap <silent> <leader>L :lclose<CR>
nnoremap <silent> <leader>O :lopen<CR>

" insert blank line without entering insert mode
nnoremap <CR> o<Esc>

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
