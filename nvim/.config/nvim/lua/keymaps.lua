-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Remap space as leader key
map("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------- LEADER KEY NAME SPACES -------------
-- Leader-A: ASCII FONTS 
-- Leader-B:
-- Leader-C:
-- Leader-D: DELETE WITHOUT COPY 
-- Leader-E:
-- Leader-F: FIND     (Mostly Telescope) 
-- Leader-G:
-- Leader-H: PREV BUFFER 
-- Leader-I:
-- Leader-J:
-- Leader-K:
-- Leader-L: NEXT BUFFER 
-- Leader-M:
-- Leader-N: NOTES     (mostly VimWiki) 
-- Leader-O:
-- Leader-P: PASTE (+) 
-- Leader-Q: QUIT 
-- Leader-R: RELOAD 
-- Leader-S: SHOW      (toggle interface options) 
-- Leader-T: TERMINAL 
-- Leader-U:
-- Leader-V:
-- Leader-W: WIMWIKI 
-- Leader-X:
-- Leader-Y: YANK (+) 
-- Leader-Z:
------------------------------------------------------

-- unset the 'last search pattern' register on return
map("n", "<CR>", ":nohlsearch<CR>")

-- access system clipboard
map("n", "<Leader>p", "\"+p")
map({"n", "v"}, "<Leader>y", "\"+y")
map("i", "<C-v>", "\"+p")
map("i", "<C-c>", "\"+y")

-- delete without copy
map({"n", "v"}, "<Leader>d", "\"_d")

-- better j and k movement in documents with linebreak
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<down>", "gj")
map("n", "<up>", "gk")
map("i", "<down>", "<Esc>gj")
map("i", "<up>", "<Esc>gk")

-- center line on screen after jumping up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- (S-d delete Line is annoying if you scroll with C-d)
map("n", "<S-d>", "")

-- Tabsstops --
map("n", "<Tab>", ">>_")
map("n", "<S-Tab>", "<<_")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Move current line up and down
map("n", "<C-down>", ":move +1<CR>")
map("n", "<C-up>", ":move -2<CR>")
map("v", "<C-down>", ":move '>+1<CR>gv=gv' ")
map("v", "<C-up>", ":move '<-2<CR>gv=gv' ")

-- Entering blank lines without going into insert
map("n", "<C-o>", "o<Esc>k")
map("n", "<C-O>", "O<Esc>j")

-- Alternative for juimping to begin/end of line
map({"n", "v", "x", "o"}, "H", "^")
map({"n", "v", "x", "o"}, "L", "$")

-- alternative save command
map("n", "<C-s>", ":w<CR>")

-- BUFFER AND SPLIT NAVIGATION

-- Move to previous/next buffer
map('n', '<Leader>h', ':bp<cr>', { silent = true })
map('n', '<Leader>l', ':bn<CR>', { silent = true })

-- Better navigation through splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-w><right>", ":vertical resize +15<CR>")
map("n", "<C-w><left>", ":vertical resize -15<CR>")
map("n", "<C-w><up>", ":resize +15<CR>")
map("n", "<C-w><down>", ":resize -15<CR>")

-- close all buffers and exit vim
map("n", "<Leader>qq", ":qa!<CR>")

-- close buffer and switch to the next (if more than one exists)
map("n", "<Leader>q", ":let bnum=len(getbufinfo({'buflisted':1}))|if bnum>1|bp|bw#|else|bw|endif<CR><CR>",
	{ silent = true })

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Press jj fast to escape to normal mode
map("i", "jj", "<ESC>")

-- <LEADER>S -> SHOW / HIDE Mappings
map("", "<Leader>ss", ":set spell!<CR>") -- (show spell) toggle spellchecking
map("", "<Leader>st", ":set list!<CR>")  -- (show tab) toggle Tab/Whitespace Symbols
map("", "<Leader>sn", ":exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>") -- (show numbers) Toggle Line Number Settings

-- remap increment command because C-a is my Tmux Key
map({"n", "v"}, "<Leader>+", "<C-a>")
map({"n", "v"}, "<Leader>-", "<C-x>")

-- spcial Maps just to deal with weird layout of keyboards I use
map("i", "^", "<ESC>")
map("", "<PageUp>", "")
map("", "<PageDown>", "")

-- Terminal mode
map("t", "<Leader>t", ":terinal<CR>")
map("t", "<Esc>", [[<C-\><C-n>]]) -- use Esc to enter Normal mode inside Terminal
map("t", "<Leader>q", [[<C-\><C-n>:bd!<CR>]], { silent = true }) -- "close terminal" (delete buffer)


-- Ascii Font Shortcuts
map("n", "<Leader>am", ":.!figlet -f miniwi<CR>")
map("n", "<Leader>ac", ":.!figlet -f Cybermedium<CR>")
map("n", "<Leader>ad", ":.!figlet -f Doom<CR>")



