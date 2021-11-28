
" ============
" Vim settings
" ============

" Break on whitespace for prose
autocmd FileType markdown,text :set linebreak

" Automatically resize splits when host window is resized
augroup Misc
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END


set hidden

" Enable mouse
set mouse=a

" Show cursorline
set cursorline

" automatically yank to unnamed register / aka make global copy paste work
set clipboard=unnamedplus

" Search not cas:e-sensitive when only lower-case chars used
set incsearch
set ignorecase
set smartcase

" Define tab and newline chars with set list
set listchars=tab:▸\ ,eol:¬

" Keep undo history
set undofile

" Keep cursor away from edges of screen
set scrolloff=5

" Don't autocomment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show line numbers
set nonumber
:set relativenumber

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Status Line
" run ':h 'statusline' for options
" for color-name reference run ':so $VIMRUNTIME/syntax/hitest.vim'  
set statusline=
set statusline+=%#ErrorMsg# "color
set statusline+=\ %M "Save status 
set statusline+=%#CtrlPMode2# "color
set statusline+=\ %y "filetype
set statusline+=%#IncSearch# "color
set statusline+=\ %r "readonlyflag
set statusline+=%#Pmenu# "color
set statusline+=\ %F "filepath
set statusline+=%= "Right side settings
set statusline+=%#DiffChange# "color 
set statusline+=\ %c:%l/%L "position in document
set statusline+=%#DiffAdd# "color
set statusline+=\ %p%% "document progress
set statusline+=%#DiffText# "color
set statusline+=\ [%n] "Vim Document Buffer



" 24-bit color
" set termguicolors

" No vertical divider char
set fillchars+=vert:\ 

" Open splits below and vertical splits to the right
set splitbelow
set splitright

" Define tab and newline chars with set list
set listchars=tab:▸\ ,eol:¬

" Two space indent
set shiftwidth=2
let &softtabstop = &shiftwidth
set expandtab


" =========
" Functions
" =========

" Split line
function! BreakHere()
  s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
  call histdel("/", -1)
endfunction

" 
" ===========
" Keymaps
" ===========

map <Space> :NERDTreeToggle<CR>
map <ENTER> :Goyo<CR>
map <Leader>q :noh<CR>

" use Ctrl+hjkl to move between Splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" move selected Lines up or down one line 
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

let mapleader = "," " map leader to comma

" ===========
" Plug
" ===========

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

call plug#end()

" ===========
" WimWiki
" ===========

let wiki_1 = {}
let wiki_1.path = '~/Notes/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

" let wiki_2 = {}
" let wiki_2.path = '~/Notes/Tech'
" let wiki_2.syntax = 'markdown'
" let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()



" ===========
" Colors
" ===========

colorscheme gruvbox
" making the terminalbackground match the vim background exactly:
highlight Normal ctermbg=NONE
