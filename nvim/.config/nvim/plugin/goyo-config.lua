--vim.api.nvim_exec([[ autocmd BufRead,BufNewFile *.md :Goyo 80 ]], false)

Map("", "<Leader>g", ":Goyo<CR>", { silent = true })

vim.cmd([[
function! s:goyo_enter()
    :lua require('lualine').hide()
    :lua vim.diagnostic.disable()
    :lua require("indent_blankline.commands").disable()
endfunction

function! s:goyo_leave()
    :lua require('lualine').hide({unhide=true})
    :lua vim.diagnostic.show()
    :lua require("indent_blankline.commands").enable()
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
]])
