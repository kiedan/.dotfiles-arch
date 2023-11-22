vim.cmd ([[
	hi FloatermBorder guibg=bg
	let g:floaterm_keymap_toggle = '<Leader>t'
	tnoremap   <silent>   <Leader>t   <C-\><C-n>:FloatermToggle<CR>
]])
--	tnoremap   <silent>   <Leader>q   <C-\><C-n>:FloatermKill<CR>
