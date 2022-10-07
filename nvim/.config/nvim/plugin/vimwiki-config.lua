vim.g.vimwiki_list = {{path = '~/Nextcloud/SpaceNotes', syntax = 'markdown', ext = '.md'}}

Map("", "<Leader>dd", ":VimwikiDiaryIndex<CR>", { silent = true })
Map("", "<Leader>wg", ":VimwikiDiaryGenerateLinksy<CR ", { silent = true })

vim.cmd("autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks")
