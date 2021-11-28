" ============
" Vim settings
" ============
"
" set leader key
let g:mapleader = "\<Space>"
  
" Break on whitespace for prose
autocmd FileType markdown,text :set linebreak

" Automatically resize splits when host window is resized
augroup Misc
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set mouse=a                             " Enable mouse
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set clipboard=unnamedplus               " Copy paste between vim and everything else 
set cursorline                          " Enable highlighting of the current line
set incsearch                           " Search not cas:e-sensitive when only lower-case chars used
set ignorecase
set smartcase
"set listchars=tab:▸\ ,eol:¬             " Define tab and newline chars with set list
set undofile                            " Keep undo history
set scrolloff=5                         " Keep cursor away from edges of screen
:set number relativenumber              " turn hybrid line numbers on
:set nu rnu                             " turn hybrid line numbers on
"set formatoptions-=cro                   " Stop newline continution of comments
set splitbelow                          " Open horizontal splits below 
set splitright                          " Open vertical splits to the right 
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
"set expandtab                           " Converts tabs to spaces
"set fillchars+=vert:\                   " No vertical divider char
"set listchars=tab:▸\ ,eol:¬             " Define tab and newline chars with set list


" ===========
" Buffer Keymappings
" ===========

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
" p>"
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>

" ===========
" Status Line
" ===========

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


" =========
" Functions
" =========

" Split line
function! BreakHere()
  s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
  call histdel("/", -1)
endfunction

" ===========
" Keymaps
" ===========

map <Space> :NERDTreeToggle<CR>
map <Leader><ENTER> :Goyo<CR>
map <Leader>q :noh<CR>
nnoremap <C-p> :Files<Cr>              " fzf File Finder 
nnoremap <C-b> :Buffer<Cr>             " fzf Buffer List
nnoremap <C-h> <C-W>h                  " use Ctrl+hjkl to move between Splits
nnoremap <C-j> <C-W>d
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap kj <Esc>                      " Alternative to escape key
xnoremap K :move '<-2<CR>gv-gv         " move selected Lines up one line 
xnoremap J :move '>+1<CR>gv-gv         " move selected Lines down one line 
nnoremap <C-TAB> :bnext<CR>            " SHIFT-TAB in general mode will move to text buffer
nnoremap <C-S-TAB> :bprevious<CR>      " SHIFT-TAB will go back
nnoremap <C-s> :w<CR>                  " Alternate way to save
nnoremap <C-Q> :wq!<CR>                " Alternate way to quit
nnoremap <leader>t :VimwikiToggleListItem<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'townk/vim-autoclose'
Plug 'gioele/vim-autoswap'
Plug 'mhinz/vim-startify'       

call plug#end()

" ===========
" Plugin Settings
" ===========
"
" enable autoswap Plugin to switch to corect tmux window
" (install wmctrl to automatically switch to the Vim window with the open file)
let g:autoswap_detect_tmux = 1


let g:startify_custom_header = [
                           \ '                                                             ', 
         \ '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
         \ '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
         \ '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
         \ '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
         \ '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
         \ '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
                                 \] 


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

au BufNewFile ~/Notes/diary/*.md :silent 0r !~/.config/vimwiki/bin/generate-vimwiki-diary-template '%'
" ===========
" Calendar
" ===========
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

map <leader>c :call ToggleCalendar()



" ===========
" Colors
" ===========

colorscheme gruvbox


"
" ===========
" Temporary Stuff
" ===========
"
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>"
"
"
"
                                                                                                                                                                                                                                                                                                                                                                                             


