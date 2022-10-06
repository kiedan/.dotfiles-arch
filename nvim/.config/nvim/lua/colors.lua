-- Set colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- set all bars background to bg color
vim.cmd ([[
hi StatusLine guifg=bg
hi clear TabLineFill
hi clear SignColumn
hi clear FoldColumn
hi MsgArea guifg=#504945
hi WinBar guifg=#504945
hi EndOfBuffer guifg=bg
hi LineNr guifg=#504945
hi VertSplit guibg=bg guifg=#3c3836
]])

-- KEYMAPS 
--Map("n", "<Leader>nn", ":hi LineNr guifg=bg<CR>")
--Map("n", "<Leader>n", ":hi LineNr guifg=#504945<CR>")
