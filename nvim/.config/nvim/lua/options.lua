local options = { clipboard = "",                          -- not "unnamedplus" -> handle system clipboard with Leader+y/p fileencoding = "utf-8",                  -- the encoding written to a file
	ignorecase = true,                       -- ignore case in search patterns
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	undofile = true,                         -- enable persistent undo
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                        -- convert tabs to spaces
	shiftwidth = 4,                          -- the number of spaces inserted for each indentation
	tabstop = 4,                             -- number of spaces inserted for a tab
	relativenumber = true,                   -- set relative numbered lines
	number = true,
	spelllang="en_us,de_de",                 -- configure Languages for Spellchecking
	spell = true,                            -- activate spellchecking
	wrap = false,                            -- display lines as one long line
	scrolloff = 5,                           -- Keep cursor away from edges of screen  
	sidescrolloff = 20,
	keymodel="startsel",                     -- Make Shift Key start selection
	updatetime = 2000,                       -- faster updates (default 400)
	timeoutlen = 800,                        -- Time in milliseconds to wait for Keymap  sequence to complete (default 1000)
	wildmode="longest:full,full",            -- change autocomplete menu in commandline to horizontal 
	wildignorecase=true,                     -- autocomplete not case-sensitiv
	conceallevel=0,
	cursorline = true,

	-- clean ui
	showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	signcolumn = "yes",                      -- always show signcolumn (left of numbers for diagnostics etc)
	foldcolumn="5",
	winbar = "      %t",
	laststatus=3,
	statusline=" ",
	showtabline=3,
	tabline= " ",
}
vim.opt.wildoptions:remove('pum')
	
-- show Tab Indentation
vim.opt.list=true
vim.opt.lcs='tab:| '


for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd("set sessionoptions+=resize,tabpages,winsize")       -- make sessions remember splits and stuff

--vim.cmd "set whichwrap+=<,>,[,],h,l"                  -- cursor jumps to next/prev line when moving with h&l 
vim.cmd("autocmd BufEnter * set formatoptions-=cro")  -- disable automatic newline continuation of comments
vim.cmd(":autocmd CursorHold * echo")                 -- :echo clears (error)messages, triggered  on Cusorhold (defalt 4 sec, use updatetime=2000 for 2sec) 
vim.cmd("autocmd InsertEnter * set cul!")               -- disable cursorline in insert mode
vim.cmd("autocmd InsertLeave * set cul")                -- disable cursorline in insert mode
vim.cmd("autocmd BufRead,BufNewFile   *.txt setlocal wrap linebreak") --
vim.cmd("autocmd BufRead,BufNewFile   *.md setlocal wrap linebreak") --

-- AUTO SAVE & READ 
vim.cmd"set autowrite"
vim.cmd"set autowriteall"
-- autosave current file after changes are made (if file is not readonly) ...
vim.cmd("autocmd TextChanged,InsertLeave * if &readonly == 0 && filereadable(bufname('%')) | silent write | endif") --
-- auto-update file if changed elsewhere 
vim.cmd"set autoread"                      -- trigger `autoread` when files changes on disk
vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")


