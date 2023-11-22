vim.g.vimwiki_list = {{
	path = '~/Nextcloud/SpaceNotes',
	syntax = 'markdown',
	ext = '.md',
}}

vim.cmd("autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks")
--vim.g.conceal_onechar_markers=0

vim.keymap.set("n", "<Leader>ni", ":VimwikiDiaryIndex<CR>", { silent = true })
vim.keymap.set("n", "<Leader>nm", ":VimwikiMakeDiaryNote<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ng", ":VimwikiDiaryGenerateLinksy<CR>", { silent = true })
vim.keymap.set("", "<Leader>nn", "@<Plug>VimwikiDiaryNextDay", { silent = true })
vim.keymap.set("", "<Leader>np", "@<Plug>VimwikiDiaryPrevDay", { silent = true })
vim.keymap.set("", "<Leader>nx", ":VimwikiDeleteFile<CR>", {})
vim.keymap.set("", "<Leader>nr", ":VimwikiRenameFile<CR>", {})
vim.keymap.set("", "<Leader><CR>", ":VimwikiVSplitLink reuse<CR>", {})
vim.keymap.set("n", "<Leader>nt", ":e ~/Nextcloud/SpaceNotes/todo.txt<CR>", { silent = true })
