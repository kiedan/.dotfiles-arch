-- Import & assign the map() function from the utils module globally 
	Map = require("utils").map

-- Remap space as leader key
Map("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- unset the 'last search pattern' register on return
Map("n", "<CR>", ":nohlsearch<CR><CR>")

-- access system clipboard
Map("n", "<Leader>p", "\"+p")
Map("n", "<Leader>y", "\"+y")
Map("v", "<Leader>y", "\"+y")
Map("i", "<C-v>", "\"+p")
Map("i", "<C-c>", "\"+y")

-- delete without copy
Map("n", "<Leader>d", "\"_d")
Map("v", "<Leader>d", "\"_d")

-- better j and k movement in documents with linebreak
Map("n", "j", "gj")
Map("n", "k", "gk")
Map("n", "<down>", "gj")
Map("n", "<up>", "gk")
Map("i", "<down>", "<Esc>gj")
Map("i", "<up>", "<Esc>gk")

-- center line on screen after jumping up/down
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-d>zz")

-- Tabsstops --
Map("n", "<Tab>", ">>_")
Map("n", "<S-Tab>", "<<_")
Map("v", "<Tab>", ">gv")
Map("v", "<S-Tab>", "<gv")

-- Move current line up and down  
Map("n", "<C-down>", ":move +1<CR>")
Map("n", "<C-up>", ":move -2<CR>")
Map("v", "<C-down>", ":move '>+1<CR>gv=gv' ")
Map("v", "<C-up>", ":move '<-2<CR>gv=gv' ")

-- Entering blank lines without going into insert
Map("n", "<C-o>", "o<Esc>k")
Map("n", "<C-O>", "O<Esc>j")

-- Alternative for juimping to begin/end of line
Map("n", "H", "^")
Map("n", "L", "$")
Map("v", "L", "$")
Map("x", "H", "^")
Map("x", "L", "$")
Map("o", "H", "^")
Map("o", "L", "$")
Map("v", "H", "^")

-- alternative save command
Map("n", "<C-s>", ":w<CR>")

-- BUFFER AND SPLIT NAVIGATION

-- Move to previous/next
Map('n', '<Leader>h', ':bp<cr>', { silent = true })
Map('n', '<Leader>l', ':bn<CR>', { silent = true })

-- Better navigation through splits
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")

Map("n", "<C-w><right>", ":vertical resize +5<CR>")
Map("n", "<C-w><left>", ":vertical resize -5<CR>")
Map("n", "<C-w><up>", ":resize +5<CR>")
Map("n", "<C-w><down>", ":resize -5<CR>")


-- close all buffers and exit vim 
Map("n", "<Leader>qq", ":qa!<CR>")

-- close buffer and switch to the next (if more than one exists) 
Map("n", "<Leader>q", ":let bnum=len(getbufinfo({'buflisted':1}))|if bnum>1|bp|bw#|else|bw|endif<CR><CR>", { silent = true })



-- Reload configuration without restart nvim
Map("n", "<leader>r", ":so %<CR>")

-- Press jj fast to escape to normal mode
Map("i", "jj", "<ESC>")

Map ("", "<Leader>ns", ":set spell!<CR>")		-- toggle spellchecking
Map ("", "<Leader>nt", ":set list!<CR>")
Map ("", "<Leader>n", ":let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>")
--Map ("", "<Leader>nl", "set number! | set relativenumber!")
