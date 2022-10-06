vim.g.vimwiki_list = {{path = '~/Nextcloud/SpaceNotes', syntax = 'markdown', ext = '.md'}}

Map("", "<Leader>wd", ":VimwikiDiaryIndex", { silent = true })
Map("", "<Leader>wg", ":VimwikiDiaryGenerateLinks", { silent = true })

vim.cmd("autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks")
