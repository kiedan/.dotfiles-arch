
-- Configure Netrw Filemanager

vim.cmd ([[
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4

	let g:netrw_altv = 1
	let g:netrw_winsize = 17
]])
-- fix C-l keymap for netrw buffer    
vim.cmd ([[
	augroup netrw_mapping
		autocmd!
		autocmd filetype netrw call NetrwMapping()
	augroup END

	function! NetrwMapping()
		nnoremap <buffer> <C-l> <C-w>l
		nmap <buffer> H u
		nmap <buffer> h -^
		nmap <buffer> l <CR>

		nmap <buffer> . gh
		nmap <buffer> P <C-w>z
		nmap <buffer> a % 

	endfunction
]])
----------- I N F O -----------
-- H: Will "go back" in history.
-- h: Will "go up" a directory.
-- l: Will open a directory or a file.
-- .: Will toggle the dotfiles.
-- P: Will close the preview window.
-- L: Will open a file and close Netrw.
-- A: Will add File in current directory

Map("n", "<Leader><Leader>", ":Lexplore<CR>")
Map("n", "<Leader>cd", ":Lexplore %:p:h<CR>")
